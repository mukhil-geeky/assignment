let originalArray = [
    {
      "FirstName": "John",
      "LastName": "Doe",
      "Age": 20,
      "Department": "Computer Science"
    },
    {
      "FirstName": "Jane",
      "LastName": "Smith",
      "Age": 22,
      "Department": "Physics"
    },
    {
      "FirstName": "Michael",
      "LastName": "Johnson",
      "Age": 21, 
      "Department": "Mathematics"
    },
    {
      "FirstName": "Sarah",
      "LastName": "Williams",
      "Age": 19,
      "Department": "Computer Science"
    },
    {
      "FirstName": "Robert",
      "LastName": "Brown",
      "Age": 23,
      "Department": "Mathematics"
    },
    {
      "FirstName": "Emily",
      "LastName": "Davis",
      "Age": 20,
      "Department": "Computer Science"
    }
  ];

  // 1. List the students whose department is computer science.

  const csstudents =originalArray.filter(student => student.Department==='Computer Science');
  console.log('list of students in Computer Science Deparetment :');
  csstudents.forEach(element => {
    console.log(element);
  });
  
  // 2. List the first name of students whose age is greater than  21

  const studentNames =originalArray.filter(student => student.Age > 21);
  console.log('Names of Students who are older than 23 : ');
  studentNames.forEach(element => {
    console.log(element.FirstName);
  });


  //Check whether a student having a first name as Robert is present in the Computer Science Department. The result should be in boolean type
  
  const nameRobert =csstudents.some(student => student.FirstName === 'Robert');
  console.log('Student Named Robert is present in Computer Science Department  :',nameRobert);

  //  Check whether there is any student whose age is greater than 23 is studying in the Maths department.The result should be in boolean type

  const mathsGreaterThan23 = originalArray.some(student => student.Age>23 && student.Department === 'Mathematics' );

  console.log('A student who is older than 23 is studying in Mathemathics : ',mathsGreaterThan23);

  // Check whether all the students are above an age group of 18.The result should be in boolean type.

  const allAbove18 = studentNames.every(student => student.Age > 18);
  console.log('All students are older than 18 : ',allAbove18);

  // Assuming that there is only one student having a first name as John, Print his department name.

  const firtNamejohn = originalArray.find(student => student.FirstName='john');
  console.log('Department of student with name john : ',firtNamejohn.Department);



  

