import { Hono } from "hono";
import fs from "fs/promises";
import studentValidator, { studentQueryValidator } from "../validators/studentValidator.js";
import * as db from "../database/student.js";
import { HTTPException } from "hono/http-exception";
import type { PostgrestError } from "@supabase/supabase-js";

const studentApp = new Hono();

studentApp.get("/", studentQueryValidator, async (c) => {

    try {
        const query = c.req.valid("query") as StudentListQuery;
        const response = await db.getStudents(query);
        return c.json(response);
    } catch (error) {
        return c.json([]);
    }
});

studentApp.get("/:id",async (c) => {
    const { id } = c.req.param();
    try {
        const student = await db.getStudent(id);
        if (!student) {
            throw new Error("Student not found");
        }
        return c.json(student);
    } catch (error) {
        console.error(error);
        return c.json(null, 404);
    }
});

studentApp.post("/", studentValidator, async (c) => {
    try {
        const student: NewStudent = c.req.valid("json");
        const createdStudent = await db.createStudent(student);
        return c.json(createdStudent, 201);
    } catch (error) {
        console.error(error);
        if ((error as PostgrestError).code === "23505") {
            throw new HTTPException(409, {
                res: c.json({ error: "Student with email already exists" }, 409),
            });
        }
        return c.json({ error: "Failed to create student" }, 400);
    }
});

studentApp.put("/:id", studentValidator, async (c) => {
    const { id } = c.req.param();
    try {
        const body: NewStudent = c.req.valid("json");
        const student = await db.updateStudent(id, body);
        if (!student) {
            throw new HTTPException(404, {
                res: c.json({ error: "Student not found" }, 404),
            });
        }
        const updatedStudent: Student = {
            ...body,
            student_id: id,
        };
        return c.json(updatedStudent, 200);
    } catch (error) {
        console.error(error);
        throw new HTTPException(400, {
            res: c.json({ error: "Failed to update student" }, 400),
        });
    }
});

studentApp.delete("/:id", async (c) => {

    const { id } = c.req.param();
    try {
        const student = await db.deleteStudent(id);
        if (!student) {
            throw new HTTPException(404, {
                res: c.json({ error: "Student not found" }, 404),
            });
        }
        return c.json(student, 200);
    } catch (error) {
        console.error(error);
        throw new HTTPException(400, {
            res: c.json({ error: "Failed to delete student" }, 400),
        });
    }
});

export default studentApp;