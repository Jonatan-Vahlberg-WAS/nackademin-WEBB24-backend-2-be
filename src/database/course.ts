import type { PostgrestSingleResponse } from "@supabase/supabase-js";
import { supabase } from "../lib/supabase.js";

export async function getCourses(query: CourseListQuery): Promise<PaginatedListResponse<Course>> {
  const sortable = new Set(["title", "start_date"]);
  const order = query.sort_by
    ? sortable.has(query.sort_by)
      ? query.sort_by
      : "title"
    : "title";
  const startIndex = query.offset || 0;
  const endIndex = startIndex + (query.limit || 10) - 1;
  const _query = supabase
    .from("courses")
    .select("*", { count: "exact" })
    .order(order, { ascending: true })
    .range(startIndex, endIndex);

  if (query.department) {
    _query.eq("department", query.department);
  }

  if (query.q) {
    // _query.ilike("title", `%${query.q}%`); // Simple full text search
    _query.or(`title.ilike.%${query.q}%,description.ilike.%${query.q}%,instructor.ilike.%${query.q}%`); // Complex time consuming Full text search
  }

  const courses: PostgrestSingleResponse<Course[]> = await _query;
  console.log(courses);
  return {
    data: courses.data || [],
    count: courses.count || 0,
    offset: query.offset || 0,
    limit: query.limit || 10,
  };
}

export async function getCourse(id: string): Promise<Course> {
  const query = supabase.from("courses").select("*").eq("course_id", id).single();
  const response: PostgrestSingleResponse<Course> = await query;
  if(response.error) throw response.error
  return response.data;
}

export async function createCourse(course: NewCourse): Promise<Course> {
  const query = supabase.from("courses").insert(course).select().single();
  const response: PostgrestSingleResponse<Course> = await query;
  if(response.error) throw response.error
  return response.data;
}

export async function updateCourse(id: string, course: NewCourse): Promise<Course | null> {
  const courseWithoutId: NewCourse = {
    ...course,
    course_id: undefined
  }  
  const query = supabase.from("courses").update(courseWithoutId).eq("course_id", id).select().single();
  const response: PostgrestSingleResponse<Course> = await query;
  return response.data;
}

export async function deleteCourse(id: string): Promise<Course | null> {
  const query = supabase.from("courses").delete().eq("course_id", id).select().single();
  const response: PostgrestSingleResponse<Course> = await query;
  return response.data;
}