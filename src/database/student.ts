import type { PostgrestSingleResponse, SupabaseClient } from "@supabase/supabase-js";

export async function getStudents(sb: SupabaseClient, query: StudentListQuery): Promise<PaginatedListResponse<Student>> {
  const sortable = new Set(["first_name", "last_name"]);
  const order = query.sort_by
    ? sortable.has(query.sort_by)
      ? query.sort_by
      : "first_name"
    : "first_name";
  const startIndex = query.offset || 0;
  const endIndex = startIndex + (query.limit || 10) - 1;
  const _query = sb
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

export async function getStudent(sb: SupabaseClient, id: string): Promise<Student> {
  const { data, error } = await sb
    .from("students")
    .select("*")
    .eq("student_id", id)
    .single();
  if (error) {
    throw error;
  }
  return data;
}

export async function createStudent(sb: SupabaseClient, student: NewStudent): Promise<Student> {
  const { data, error } = await sb
    .from("students")
    .insert(student)
    .select()
    .single();
  if (error) {
    throw error;
  }
  return data;
}

export async function updateStudent(sb: SupabaseClient, id: string, student: NewStudent): Promise<Student> {
  const { data, error } = await sb
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

export async function deleteStudent(sb: SupabaseClient, id: string): Promise<Student> {
  const { data, error } = await sb
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