-- Create courses table
CREATE TABLE courses (
    course_id VARCHAR(255) PRIMARY KEY UNIQUE,
    title VARCHAR(255) NOT NULL,
    instructor VARCHAR(255) NOT NULL,
    credits INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    department VARCHAR(255),
    description TEXT
);

-- INDEXES
CREATE INDEX idx_courses_title ON courses (title);
CREATE INDEX idx_courses_instructor ON courses (instructor);
CREATE INDEX idx_courses_department ON courses (department);

-- Insert data into courses table
-- Check in course-seed.sql file for data