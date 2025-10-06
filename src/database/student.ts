import type { PostgrestSingleResponse } from "@supabase/supabase-js";
import { supabase } from "../lib/supabase.js";

export async function getStudents(query: StudentListQuery): Promise<PaginatedListResponse<Student>> {
  const sortable = new Set(["first_name", "last_name"]);
  const order = query.sort_by
    ? sortable.has(query.sort_by)
      ? query.sort_by
      : "first_name"
    : "first_name";
  const startIndex = query.offset || 0;
  const endIndex = startIndex + (query.limit || 10) - 1;
  const _query = supabase
    .from("students")
    .select("*", { count: "exact" })
    .order(order, { ascending: true })
    .range(startIndex, endIndex);

  if (query.q) {
    _query.or(`first_name.ilike.%${query.q}%,last_name.ilike.%${query.q}%,email.ilike.%${query.q}%`);
  }

  const students: PostgrestSingleResponse<Student[]> = await _query;
  return {
    data: students.data || [],
    count: students.count || 0,
    offset: query.offset || 0,
    limit: query.limit || 10,
  };
}

export async function getStudent(id: string): Promise<Student> {
  const { data, error } = await supabase
    .from("students")
    .select("*")
    .eq("student_id", id)
    .single();
  if (error) {
    throw error;
  }
  return data;
}

export async function createStudent(student: NewStudent): Promise<Student> {
  const { data, error } = await supabase
    .from("students")
    .insert(student)
    .select()
    .single();
  if (error) {
    throw error;
  }
  return data;
}

export async function updateStudent(id: string, student: NewStudent): Promise<Student> {
  const { data, error } = await supabase
    .from("students")
    .update(student)
    .eq("student_id", id)
    .select()
    .single();
  if (error) {
    throw error;
  }
  return data;
}

export async function deleteStudent(id: string): Promise<Student> {
  const { data, error } = await supabase
    .from("students")
    .delete()
    .eq("student_id", id)
    .select()
    .single();
  if (error) {
    throw error;
  }
  return data;
}