INSERT INTO students (
  student_id, first_name, last_name, email, date_of_birth, major, phone_number, course_id
)
SELECT
  x.student_id, x.first_name, x.last_name, x.email, x.date_of_birth, x.major, x.phone_number, x.course_id
FROM jsonb_to_recordset($$[
  {
    "student_id": "std_001",
    "first_name": "Anna",
    "last_name": "Karlsson",
    "email": "anna.k@example.com",
    "date_of_birth": "2003-05-15",
    "major": "Software Engineering",
    "course_id": "pgsql-101"
  },
  {
    "student_id": "std_003",
    "first_name": "Mikael",
    "last_name": "Persson",
    "email": "m.persson@example.com",
    "date_of_birth": "2002-01-20",
    "major": "Data Science",
    "phone_number": "070-1112233",
    "course_id": "pgsql-101"
  },
  {
    "student_id": "std_007",
    "first_name": "Sofia",
    "last_name": "Lindgren",
    "email": "sofia.lindgren@example.com",
    "date_of_birth": "2004-03-12",
    "course_id": "pgsql-101"
  },
  {
    "student_id": "std_002",
    "first_name": "Lars",
    "last_name": "Andersson",
    "email": "lars.a@example.com",
    "date_of_birth": "2001-11-30",
    "major": "Software Engineering",
    "phone_number": "073-9876543",
    "course_id": "webdev-205"
  },
  {
    "student_id": "std_004",
    "first_name": "Emma",
    "last_name": "Nilsson",
    "email": "emma.nilsson@example.com",
    "date_of_birth": "2003-08-22",
    "course_id": "webdev-205"
  },
  {
    "student_id": "std_009",
    "first_name": "William",
    "last_name": "Berg",
    "email": "william.b@example.com",
    "date_of_birth": "2002-12-01",
    "major": "Interaction Design",
    "course_id": "webdev-205"
  },
  {
    "student_id": "std_005",
    "first_name": "Karin",
    "last_name": "Eriksson",
    "email": "karin.e@example.com",
    "date_of_birth": "2000-06-10",
    "major": "History",
    "phone_number": "076-5554433",
    "course_id": "hist-101"
  },
  {
    "student_id": "std_006",
    "first_name": "Peter",
    "last_name": "Johansson",
    "email": "p.johansson@example.com",
    "date_of_birth": "2001-02-05",
    "course_id": "hist-101"
  },
  {
    "student_id": "std_010",
    "first_name": "Olivia",
    "last_name": "Holm",
    "email": "olivia.h@example.com",
    "date_of_birth": "2004-07-19",
    "major": "Political Science",
    "course_id": "hist-101"
  },
  {
    "student_id": "std_008",
    "first_name": "Erik",
    "last_name": "Gustafsson",
    "email": "erik.g@example.com",
    "date_of_birth": "2002-09-03",
    "major": "Computer Science",
    "course_id": "algo-301"
  }
]
$$::jsonb) AS x(
  student_id   text,
  first_name   text,
  last_name    text,
  email        text,
  date_of_birth date,
  major        text,
  phone_number text,
  course_id    text
)
ON CONFLICT (student_id) DO UPDATE SET
  first_name   = EXCLUDED.first_name,
  last_name    = EXCLUDED.last_name,
  email        = EXCLUDED.email,
  date_of_birth= EXCLUDED.date_of_birth,
  major        = EXCLUDED.major,
  phone_number = EXCLUDED.phone_number,
  course_id    = EXCLUDED.course_id;
