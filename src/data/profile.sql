CREATE TYPE user_role AS ENUM ('student', 'teacher', 'admin');


create table if not exists public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  full_name text default '',
  avatar_url text default '',
  bio text default '',
  updated_at timestamp with time zone default now(),
  role user_role default 'student'
);

-- Trigger to create a profile when a user is created
CREATE OR REPLACE FUNCTION public.create_profile()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.profiles (user_id)
  VALUES (NEW.id)
  ON CONFLICT (user_id) DO NOTHING; -- idempotent
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS create_profile_trigger ON auth.users;

CREATE TRIGGER create_profile_trigger
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION public.create_profile();

INSERT INTO public.profiles (user_id)
SELECT id
FROM auth.users
ON CONFLICT (user_id) DO NOTHING;