INSERT INTO courses (
  course_id, title, instructor, credits, start_date, end_date, department, description
)
SELECT
  x.course_id, x.title, x.instructor, x.credits, x.start_date, x.end_date, x.department, x.description
FROM jsonb_to_recordset($$
  [
  {
    "course_id": "pgsql-101",
    "title": "PostgreSQL for Beginners",
    "instructor": "Dr. Elin Svensson",
    "credits": 5,
    "start_date": "2025-09-08",
    "end_date": "2025-11-20",
    "department": "Computer Science",
    "description": "An introductory course to relational databases using PostgreSQL. Covers everything from basic queries to table design."
  },
  {
    "course_id": "webdev-205",
    "title": "Modern Web Development",
    "instructor": "Dr. David Chen",
    "credits": 7,
    "start_date": "2025-09-08",
    "department": "Computer Science",
    "description": "A project-based course on building modern, full-stack web applications with React and Node.js."
  },
  {
    "course_id": "hist-101",
    "title": "Swedish History 101",
    "instructor": "Prof. Eva Lundström",
    "credits": 5,
    "start_date": "2025-09-10",
    "end_date": "2025-12-05",
    "department": "History"
  },
  {
    "course_id": "algo-301",
    "title": "Data Structures & Algorithms",
    "instructor": "Dr. Elin Svensson",
    "credits": 10,
    "start_date": "2025-10-01"
  },
  {
    "course_id": "ai-205",
    "title": "Introduction to Artificial Intelligence",
    "instructor": "Dr. Elin Svensson",
    "credits": 4,
    "start_date": "2025-09-25",
    "end_date": "2025-12-04",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "ml-210",
    "title": "Machine Learning Fundamentals",
    "instructor": "Dr. Sarah Johansson",
    "credits": 5,
    "start_date": "2025-10-15",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "ds-220",
    "title": "Introduction to Data Science",
    "instructor": "Dr. Sarah Johansson",
    "credits": 4,
    "start_date": "2025-10-13",
    "end_date": "2025-12-22",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "net-301",
    "title": "Computer Networks",
    "instructor": "Prof. Maria Eriksson",
    "credits": 8,
    "start_date": "2025-09-08",
    "end_date": "2025-11-17",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "sec-305",
    "title": "Cybersecurity Fundamentals",
    "instructor": "Dr. Amir Rahman",
    "credits": 5,
    "start_date": "2025-09-13",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "soft-310",
    "title": "Software Engineering Principles",
    "instructor": "Dr. Elin Svensson",
    "credits": 12,
    "start_date": "2025-10-12",
    "end_date": "2025-12-14",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "proj-320",
    "title": "Capstone Project",
    "instructor": "Dr. Sarah Johansson",
    "credits": 9,
    "start_date": "2025-10-14",
    "end_date": "2025-12-23",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "comporg-400",
    "title": "Computer Organization",
    "instructor": "Dr. Amir Rahman",
    "credits": 5,
    "start_date": "2025-09-22",
    "end_date": "2025-11-24",
    "department": "Computer Science"
  },
  {
    "course_id": "os-101",
    "title": "Operating Systems",
    "instructor": "Dr. David Chen",
    "credits": 9,
    "start_date": "2025-09-30",
    "end_date": "2025-12-09",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "hci-110",
    "title": "Human–Computer Interaction",
    "instructor": "Dr. Elin Svensson",
    "credits": 6,
    "start_date": "2025-10-12",
    "end_date": "2026-01-18",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "cloud-201",
    "title": "Cloud Computing",
    "instructor": "Dr. Sarah Johansson",
    "credits": 7,
    "start_date": "2025-09-28",
    "end_date": "2025-11-30",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "nlp-205",
    "title": "Natural Language Processing",
    "instructor": "Dr. Amir Rahman",
    "credits": 5,
    "start_date": "2025-09-21",
    "end_date": "2025-12-21",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "cv-210",
    "title": "Computer Vision",
    "instructor": "Prof. Maria Eriksson",
    "credits": 12,
    "start_date": "2025-09-17",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "db-220",
    "title": "Relational Databases",
    "instructor": "Dr. Sarah Johansson",
    "credits": 10,
    "start_date": "2025-10-15",
    "end_date": "2026-01-07",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "devops-301",
    "title": "DevOps and CI/CD",
    "instructor": "Prof. Maria Eriksson",
    "credits": 5,
    "start_date": "2025-09-11",
    "end_date": "2025-11-13",
    "department": "Computer Science",
    "description": "Covers core concepts with hands-on assignments and a practical project."
  },
  {
    "course_id": "math-305",
    "title": "Discrete Mathematics",
    "instructor": "Dr. Johan Pettersson",
    "credits": 10,
    "start_date": "2025-10-02",
    "end_date": "2026-01-01",
    "department": "Mathematics"
  },
  {
    "course_id": "calc-310",
    "title": "Calculus II",
    "instructor": "Dr. Johan Pettersson",
    "credits": 5,
    "start_date": "2025-10-12",
    "end_date": "2025-12-28",
    "department": "Mathematics",
    "description": "Emphasizes problem solving, proofs, and applications."
  },
  {
    "course_id": "lin-320",
    "title": "Linear Algebra",
    "instructor": "Dr. Johan Pettersson",
    "credits": 12,
    "start_date": "2025-09-08",
    "end_date": "2025-12-15",
    "department": "Mathematics",
    "description": "Emphasizes problem solving, proofs, and applications."
  },
  {
    "course_id": "hist-101-1",
    "title": "European History: Renaissance to Revolution",
    "instructor": "Prof. Eva Lundström",
    "credits": 5,
    "start_date": "2025-10-18",
    "end_date": "2026-01-03",
    "department": "History",
    "description": "Explores key events, sources, and historiography."
  },
  {
    "course_id": "hist-110",
    "title": "Modern Scandinavian History",
    "instructor": "Prof. Eva Lundström",
    "credits": 6,
    "start_date": "2025-10-12",
    "end_date": "2026-01-11",
    "department": "History",
    "description": "Explores key events, sources, and historiography."
  },
  {
    "course_id": "phil-201",
    "title": "Introduction to Philosophy",
    "instructor": "Dr. Lars Nilsson",
    "credits": 9,
    "start_date": "2025-09-27",
    "department": "Philosophy"
  },
  {
    "course_id": "phil-205",
    "title": "Ethics and Society",
    "instructor": "Dr. Lars Nilsson",
    "credits": 12,
    "start_date": "2025-09-12",
    "end_date": "2025-12-12",
    "department": "Philosophy",
    "description": "Discusses major thinkers and perennial questions."
  },
  {
    "course_id": "bio-210",
    "title": "General Biology I",
    "instructor": "Dr. Anna Sjöberg",
    "credits": 8,
    "start_date": "2025-10-11",
    "end_date": "2026-01-10",
    "department": "Biology",
    "description": "Introduces cellular processes, genetics, and evolution."
  },
  {
    "course_id": "bio-220",
    "title": "Ecology and Evolution",
    "instructor": "Dr. Anna Sjöberg",
    "credits": 8,
    "start_date": "2025-10-03",
    "end_date": "2026-01-09",
    "department": "Biology",
    "description": "Introduces cellular processes, genetics, and evolution."
  },
  {
    "course_id": "chem-301",
    "title": "Introduction to Chemistry",
    "instructor": "Dr. Henrik Larsson",
    "credits": 7,
    "start_date": "2025-09-22",
    "end_date": "2025-11-24",
    "department": "Chemistry",
    "description": "Focuses on atomic structure, bonding, and reactions."
  },
  {
    "course_id": "chem-305",
    "title": "Organic Chemistry I",
    "instructor": "Dr. Henrik Larsson",
    "credits": 4,
    "start_date": "2025-09-12",
    "end_date": "2025-12-19",
    "department": "Chemistry"
  },
  {
    "course_id": "phys-310",
    "title": "Physics for Scientists and Engineers",
    "instructor": "Dr. Sofia Berg",
    "credits": 5,
    "start_date": "2025-10-10",
    "end_date": "2025-12-19",
    "department": "Physics",
    "description": "Covers mechanics, waves, and energy."
  },
  {
    "course_id": "phys-320",
    "title": "Electromagnetism",
    "instructor": "Dr. Sofia Berg",
    "credits": 7,
    "start_date": "2025-10-08",
    "end_date": "2025-12-31",
    "description": "Covers mechanics, waves, and energy."
  },
  {
    "course_id": "econ-400",
    "title": "Principles of Economics",
    "instructor": "Prof. Ingrid Nyman",
    "credits": 10,
    "start_date": "2025-10-07",
    "department": "Economics",
    "description": "Surveys micro and macroeconomic principles."
  },
  {
    "course_id": "econ-101",
    "title": "Intermediate Microeconomics",
    "instructor": "Prof. Ingrid Nyman",
    "credits": 10,
    "start_date": "2025-09-29",
    "end_date": "2025-12-01",
    "department": "Economics",
    "description": "Surveys micro and macroeconomic principles."
  },
  {
    "course_id": "psy-110",
    "title": "Introduction to Psychology",
    "instructor": "Dr. Helena Olsson",
    "credits": 6,
    "start_date": "2025-09-25",
    "end_date": "2025-12-18",
    "department": "Psychology",
    "description": "Examines cognition, behavior, and research methods."
  },
  {
    "course_id": "psy-201",
    "title": "Cognitive Psychology",
    "instructor": "Dr. Helena Olsson",
    "credits": 4,
    "start_date": "2025-10-19",
    "end_date": "2026-01-18",
    "department": "Psychology"
  },
  {
    "course_id": "stat-205",
    "title": "Statistics and Probability",
    "instructor": "Dr. Johan Lindström",
    "credits": 6,
    "start_date": "2025-10-04",
    "end_date": "2025-12-27",
    "department": "Statistics"
  },
  {
    "course_id": "stat-210",
    "title": "Applied Regression",
    "instructor": "Dr. Johan Lindström",
    "credits": 10,
    "start_date": "2025-09-08",
    "end_date": "2025-12-01",
    "department": "Statistics",
    "description": "Covers probability, estimation, and inference."
  },
  {
    "course_id": "dsci-220",
    "title": "Data Wrangling and Visualization",
    "instructor": "Prof. Maria Eriksson",
    "credits": 12,
    "start_date": "2025-09-17",
    "end_date": "2025-11-26",
    "department": "Data Science",
    "description": "Hands-on work with data pipelines, visualization, and modeling."
  },
  {
    "course_id": "dsci-301",
    "title": "Big Data Systems",
    "instructor": "Prof. Maria Eriksson",
    "credits": 9,
    "start_date": "2025-09-11",
    "end_date": "2025-11-13",
    "department": "Data Science"
  },
  {
    "course_id": "bus-305",
    "title": "Introduction to Management",
    "instructor": "Prof. Ingrid Nyman",
    "credits": 4,
    "start_date": "2025-10-10",
    "end_date": "2025-12-12",
    "description": "Covers management frameworks and case studies."
  },
  {
    "course_id": "bus-310",
    "title": "Entrepreneurship",
    "instructor": "Prof. Ingrid Nyman",
    "credits": 10,
    "start_date": "2025-09-15",
    "end_date": "2025-12-15",
    "department": "Business",
    "description": "Covers management frameworks and case studies."
  },
  {
    "course_id": "soc-320",
    "title": "Social Psychology",
    "instructor": "Dr. Helena Olsson",
    "credits": 9,
    "start_date": "2025-09-24",
    "end_date": "2025-12-03",
    "department": "Sociology",
    "description": "Analyzes institutions, culture, and social change."
  },
  {
    "course_id": "soc-400",
    "title": "Sociological Theory",
    "instructor": "Dr. Helena Olsson",
    "credits": 8,
    "start_date": "2025-10-07",
    "end_date": "2025-12-23",
    "department": "Sociology",
    "description": "Analyzes institutions, culture, and social change."
  },
  {
    "course_id": "env-101",
    "title": "Environmental Science Foundations",
    "instructor": "Dr. Anna Sjöberg",
    "credits": 5,
    "start_date": "2025-10-12",
    "end_date": "2025-12-21",
    "department": "Environmental Science",
    "description": "Covers ecosystems, sustainability, and policy."
  },
  {
    "course_id": "env-110",
    "title": "Climate Change and Policy",
    "instructor": "Dr. Anna Sjöberg",
    "credits": 7,
    "start_date": "2025-10-01",
    "end_date": "2025-12-17",
    "department": "Environmental Science",
    "description": "Covers ecosystems, sustainability, and policy."
  },
  {
    "course_id": "ling-201",
    "title": "Introduction to Linguistics",
    "instructor": "Dr. Lars Nilsson",
    "credits": 8,
    "start_date": "2025-10-20",
    "end_date": "2025-12-22",
    "department": "Linguistics",
    "description": "Introduces phonetics, syntax, and semantics."
  },
  {
    "course_id": "ling-205",
    "title": "Phonetics and Phonology",
    "instructor": "Dr. Lars Nilsson",
    "credits": 6,
    "start_date": "2025-09-25",
    "end_date": "2025-12-11",
    "department": "Linguistics",
    "description": "Introduces phonetics, syntax, and semantics."
  },
  {
    "course_id": "lit-210",
    "title": "World Literature",
    "instructor": "Prof. Eva Lundström",
    "credits": 12,
    "start_date": "2025-09-24",
    "department": "Literature",
    "description": "Close reading and comparative analysis."
  },
  {
    "course_id": "lit-220",
    "title": "Nordic Literature",
    "instructor": "Prof. Eva Lundström",
    "credits": 9,
    "start_date": "2025-09-16",
    "end_date": "2025-12-23",
    "department": "Literature",
    "description": "Close reading and comparative analysis."
  }
]
$$::jsonb) AS x(
  course_id   text,
  title       text,
  instructor  text,
  credits     int,
  start_date  date,
  end_date    date,
  department  text,
  description text
)
ON CONFLICT (course_id) DO UPDATE SET
  title       = EXCLUDED.title,
  instructor  = EXCLUDED.instructor,
  credits     = EXCLUDED.credits,
  start_date  = EXCLUDED.start_date,
  end_date    = EXCLUDED.end_date,
  department  = EXCLUDED.department,
  description = EXCLUDED.description;
