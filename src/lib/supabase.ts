import { createClient } from "@supabase/supabase-js";
import dotenv from "dotenv"
dotenv.config();


const supabaseUrl = process.env.SUPABASE_URL;
const supabaseAnonKey = process.env.SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error(
    "Supabase not initalized add 'SUPABASE_URL' and 'SUPABASE_ANON_KEY' to enviroment variables"
  );
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
