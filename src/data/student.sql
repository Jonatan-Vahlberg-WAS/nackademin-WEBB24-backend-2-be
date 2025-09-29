CREATE TABLE students (
  student_id VARCHAR(255) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  major VARCHAR(255),
  phone_number VARCHAR(255),
  course_id VARCHAR(255) REFERENCES courses(course_id) ON DELETE SET NULL
  -- optionally: ON UPDATE CASCADE
);

-- INDEXES
CREATE INDEX idx_students_first_name ON students (first_name);
CREATE INDEX idx_students_last_name ON students (last_name);
CREATE INDEX idx_students_email ON students (email);
CREATE INDEX idx_students_date_of_birth ON students (date_of_birth);
CREATE INDEX idx_students_major ON students (major);
CREATE INDEX idx_students_phone_number ON students (phone_number);
CREATE INDEX idx_students_course_id ON students (course_id);

-- Check in student-seed.sql file for data