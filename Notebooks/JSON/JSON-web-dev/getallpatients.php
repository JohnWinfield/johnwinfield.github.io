<?php
// Connecting to DB
$db = mysqli_connect('localhost', 'root', '', 'medicaldb') or die ("I cannot connect to the database
because: " . mysqli_error());

// This code runs an SQL query against the medicaldb, and returns the result in JSON format:
$sql = "SELECT Patient.patient_first_name, Patient.patient_last_name, Patient.patient_id, Patient.patient_phone,
CONCAT ('Dr. ', doctor.doctor_last_name) as DocName,
Appointment.date_id, Appointment.time_id, Appointment.room_number
FROM Appointment
	INNER JOIN Patient
		ON Patient.patient_id = Appointment.patient_id
	INNER Join Doctor
		On Doctor.doctor_id = Appointment.doctor_id";

$result = mysqli_query($db, $sql) or die("SQL error: " . $sql . " " . mysqli_error());
// Placing SQL data into an array
$newArr = array();
while ($db_field = mysqli_fetch_assoc($result) ) {
    $newArr[] = $db_field;
}
// Converting into JSON
$jsonData = json_encode($newArr, JSON_PRETTY_PRINT); // get all products in json format.
// Displaying the JSON data in a clean format
echo "<h1>All of the SQL data converted into JSON</h1><br>";
echo "<pre>" . $jsonData . "</pre>";
?>
