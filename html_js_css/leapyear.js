function isLeapYear(year) {
    if (year % 4 === 0) {
        if (year % 100 === 0) {
            return year % 400 === 0;
        }
        return true;
    }
    return false;
}

// Example usage
const year = 2024; // Change this value to test different years
const result = isLeapYear(year);
console.log(`${year} is ${result ? "a leap year" : "not a leap year"}.`);