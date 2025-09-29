import { Hono } from "hono";
import {
  courseValidator,
  courseQueryValidator,
} from "../validators/courseValidator.js";
import * as db from "../database/course.js"

const courseApp = new Hono();

courseApp.get("/", courseQueryValidator, async (c) => {
  const query = c.req.valid("query");

  let defaultResponse: PaginatedListResponse<Course> = {
    data: [],
    count: 0,
    offset: query.offset || 0,
    limit: query.limit || 10,
  };

  try {
    const response = await db.getCourses(query)
    return c.json({
      ...defaultResponse,
      ...response,
    });
  } catch (error) {
    return c.json(defaultResponse);
  }
});

courseApp.get("/:id", async (c) => {
  const { id } = c.req.param();
  try {
    const course = await db.getCourse(id);
    if (!course) {
      throw new Error("Course not found");
    }
    return c.json(course, 200 );
  } catch (error) {
    console.error(error);
    return c.json({ error: "Course not found" }, 404);
  }
});

courseApp.post("/", courseValidator, async (c) => {
  try {
    const newCourse: NewCourse = c.req.valid("json");
    const course: Course = await db.createCourse(newCourse)
    return c.json(course,201)
  } catch (error) {
    console.error(error);
    return c.json({ error: "Failed to create course" }, 400);
  }
});

courseApp.put("/:id", courseValidator, async (c) => {
  const { id } = c.req.param();
  try {
    const newCourse: NewCourse = c.req.valid("json");
    const course = await db.updateCourse(id, newCourse);
    if (!course) {
      return c.json({ error: "Course not found" }, 404);
    }
    return c.json(course, 200);
  } catch (error) {
    console.error(error);
    return c.json({ error: "Failed to update course" }, 400);
  }
});

courseApp.delete("/:id", async (c) => {
  const { id } = c.req.param();
  try {
    const course = await db.deleteCourse(id);
    if (!course) {
      return c.json({ error: "Course not found" }, 404);
    }
    return c.json({ message: "Course deleted successfully" }, 200);
  } catch (error) {
    console.error(error);
    return c.json({ error: "Failed to delete course" }, 404);
  }
});

export default courseApp;
