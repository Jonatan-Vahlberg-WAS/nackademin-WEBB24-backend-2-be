import { Hono } from "hono";
import {
  courseValidator,
  courseQueryValidator,
} from "../validators/courseValidator.js";
import * as db from "../database/course.js";
import { HTTPException } from "hono/http-exception";
import type { PostgrestError } from "@supabase/supabase-js";
import { requireAuth } from "../middlewares/auth.js";

const courseApp = new Hono();

courseApp.get("/", courseQueryValidator, async (c) => {
  const query = c.req.valid("query");
  const sb = c.get("supabase");

  let defaultResponse: PaginatedListResponse<Course> = {
    data: [],
    count: 0,
    offset: query.offset || 0,
    limit: query.limit || 10,
  };

  try {
    const response = await db.getCourses(sb, query);
    return c.json({
      ...defaultResponse,
      ...response,
    });
  } catch (error) {
    console.error("Error in fetching courses", error);
    return c.json(defaultResponse);
  }
});

courseApp.get("/:id", async (c) => {
  const { id } = c.req.param();
  const sb = c.get("supabase");
  try {
    const course = await db.getCourse(sb, id);
    return c.json(course, 200);
  } catch (error) {
    console.error("Error in getting course", error);
    throw new HTTPException(404, {
      res: c.json({ error: "Course not found" }, 404),
    });
  }
});

courseApp.post("/", requireAuth, courseValidator, async (c) => {
  try {
    const sb = c.get("supabase");
    const newCourse: NewCourse = c.req.valid("json");
    const course: Course = await db.createCourse(sb, newCourse);
    return c.json(course, 201);
  } catch (error: any) {
    console.error(error);
    if ((error as PostgrestError).code === "23505") {
      throw new HTTPException(409, {
        res: c.json(
          {
            error: "There is a course with this 'id' allready",
          },
          409
        ),
      });
    }
    throw new HTTPException(400, {
      res: c.json(
        {
          error: "Course could not be created",
        },
        400
      ),
    });
  }
});

courseApp.put("/:id", requireAuth, courseValidator, async (c) => {
  const { id } = c.req.param();
  const sb = c.get("supabase");
  try {
    const newCourse: NewCourse = c.req.valid("json");
    const course = await db.updateCourse(sb, id, newCourse);
    if (!course) {
      throw new Error("Failed to update course");
    }
    return c.json(course, 200);
  } catch (error) {
    console.error(error);
    throw new HTTPException(404, {
      res: c.json({ error: "Failed to update course" }, 404),
    });
  }
});

courseApp.delete("/:id", requireAuth, async (c) => {
  const { id } = c.req.param();
  const sb = c.get("supabase");
  try {
    const course = await db.deleteCourse(sb, id);
    if (!course) {
      throw new Error("Failed to delete course");
    }
    return c.json({ message: "Course deleted successfully" }, 200);
  } catch (error) {
    console.error(error);
    return c.json({ error: "Failed to delete course" }, 404);
  }
});

export default courseApp;
