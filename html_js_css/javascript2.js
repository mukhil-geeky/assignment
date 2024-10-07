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
  console.log('\nlist of students in Computer Science Deparetment :');
  csstudents.forEach(element => {
    console.log(element);
  });
  
  // 2. List the first name of students whose age is greater than  21

  const studentNames =originalArray.filter(student => student.Age > 21);
  console.log('\nNames of Students who are older than 23 : ');
  studentNames.forEach(element => {
    console.log(element.FirstName);
  });

  //Check whether a student having a first name as Robert is present in the Computer Science Department. The result should be in boolean type
  
  const nameRobert =csstudents.some(student => student.FirstName === 'Robert');
  console.log('\nStudent Named Robert is present in Computer Science Department  :',nameRobert);

  //  Check whether there is any student whose age is greater than 23 is studying in the Maths department.The result should be in boolean type

  const mathsGreaterThan23 = originalArray.some(student => student.Age>23 && student.Department === 'Mathematics' );

  console.log('\nA student who is older than 23 is studying in Mathemathics : ',mathsGreaterThan23);

  // Check whether all the students are above an age group of 18.The result should be in boolean type.

  const allAbove18 = studentNames.every(student => student.Age > 18);
  console.log('\nAll students are older than 18 : ',allAbove18);

  // Assuming that there is only one student having a first name as John, Print his department name.

  const firtNamejohn = originalArray.find(student => student.FirstName='john');
  console.log('\nDepartment of student with name john : ',firtNamejohn.Department);

let secondArray = [
    {
      "MovieName": "The Great Adventure",
      "ActorName": "John Smith",
      "ReleaseDate": "2023-01-15"
    },
    {
      "MovieName": "Mystery in the Woods",
      "ActorName": "Emily Johnson",
      "ReleaseDate": "2022-09-28"
    },
    {
      "MovieName": "Love and Destiny",
      "ActorName": "Michael Brown",
      "ReleaseDate": "2023-05-02"
    },
    {
      "MovieName": "City of Shadows",
      "ActorName": "Sophia Williams",
      "ReleaseDate": "2023-03-12"
    },
    {
      "MovieName": "The Last Stand",
      "ActorName": "William Davis",
      "ReleaseDate": "2022-11-07"
    },
    {
      "MovieName": "Echoes of Time",
      "ActorName": "Olivia Wilson",
      "ReleaseDate": "2022-12-19"
    }
  ];

  //List the movie name along with the actor name of those movies released in the year 2022

  const movieActorName = secondArray.filter(Element => new Date(Element.ReleaseDate).getFullYear() === 2022);
  console.log('\nList the movie name along with the actor name of those movies released in the year 2022');
  movieActorName.forEach(Element => {
    console.log(`${Element.MovieName} -- ${Element.ActorName}`);
  });


//  List the movie names released in the year 2023 where the actor is William Davis

const WilliamDavis2023 = secondArray.filter(Element => Element.ActorName === 'William Davis' && new Date(Element.ReleaseDate) === 2023);
console.log('\nList the movie names released in the year 2023 where the actor is William Davis');
WilliamDavis2023.forEach(Element => {
  console.log(`${Element.MovieName}`);
});

// Retrieve the Actor name and release date of the movie “The Last Stand”

const lastStand = secondArray.filter(x => x.MovieName === 'The Last Stand');
console.log('\nRetrieve the Actor name and release date of the movie “The Last Stand”');
lastStand.forEach(Element => {
  console.log(`Actor Name : ${Element.MovieName} \nRelease Date : ${Element.ReleaseDate}`);
});

// Check whether there is any movie in the list with actor name “John Doe”

const johnDoe = secondArray.some(x => x.ActorName ==='John Doe');
console.log(`\nActor named John Doe is presenet in one of the movie list : ${johnDoe}`);

// Display the count of movies where the actor name is "Sophia Williams"

numberOfMoviesOfSophiaWilliams = secondArray.filter(x => x.ActorName === 'Sophia Williams').length;
console.log(`\nThe count of movies where the actor name is "Sophia Williams" : ${numberOfMoviesOfSophiaWilliams}`);

/* Insert an element
		{
   			 "MovieName": "The Final Stage",
    			"ActorName": "John Doe",
   	 		"ReleaseDate": "2022-08-11"
 		 }
	as last element
*/

secondArray.push({
    "MovieName": "The Final Stage",
    "ActorName": "John Doe",
    "ReleaseDate": "2022-08-11"
});


// Check whether there exists any duplicate movie names present in the array

const Movie = secondArray.map(x => x.MovieName);
const duplicateMovie = Movie.some((name,index) => Movie.indexOf(name) != index);
console.log(`\nwhether there exists any duplicate movie names present in the array : ${duplicateMovie}`);


// Create a new array starting from the movie "City of Shadows"

const splitIndex = secondArray.findIndex(x => x.MovieName ==='City of Shadows');
console.log(splitIndex);
let newMovieArray = secondArray.slice(splitIndex);
console.log(`\New array starting from the movie "City of Shadows`)
newMovieArray.forEach(x => {
    console.log(x);
})

//  List the distinct actor names in array


let distactors = [];
newMovieArray.forEach(x => {
    if(!distactors.includes(x.ActorName))
        { 
            distactors.push(x.ActorName);
          }
});

console.log(`\nList of distinct Actors in sliced list : ${distactors}`);


/* 
Insert an element
		{
   			 "MovieName": "Rich & Poor",
    			"ActorName": "Johnie Walker",
   	 		"ReleaseDate": "2023-08-11"
 		 }
as next element to movie “Love and Destiny”
*/

const splitpos = secondArray.findIndex(x => x.MovieName === 'Love and Destiny');
secondArray.splice((splitpos+1),0,{
                "MovieName": "Rich & Poor",
    			"ActorName": "Johnie Walker",
   	 		    "ReleaseDate": "2023-08-11"});


// Display the count of distinct actor names in array


let distactors2 = [];
secondArray.forEach(x => {
    if(!distactors2.includes(x.ActorName))
        { 
            distactors2.push(x.ActorName);
          }
});

console.log(`\nList of distinct Actors in old updated list : ${distactors2.length}`);


//  Remove the movie named  "The Last Stand"

const theLastStand = secondArray.findIndex(x => x.MovieName ==='The Last Stand');
secondArray.splice(theLastStand,1);

secondArray.forEach( x => {
    console.log(x);
})

// Check whether all the movies are released after 2021 Dec 31

const movieAfter2021 = secondArray.every(x => Date(x.ReleaseDate) > 2021-12-31);
console.log(`\nwhether all the movies are released after 2021 Dec 31 : ${movieAfter2021}`);

// Update movie named  "City of Shadows" ‘s release date as  "2023-03-13"

const ChangeDate = secondArray.find(x => x.MovieName ==='City of Shadows');
if(ChangeDate)
    {
      ChangeDate.ReleaseDate = '2023-03-13' ; 
    }

// Create a new array of movie names whose movie name length is greater than 10

const movieLengthGreaterThan8 = secondArray.filter(x => x.MovieName.length > 10);
