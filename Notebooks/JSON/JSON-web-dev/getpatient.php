<?php
// Connecting to DB
$mysqli = new mysqli("localhost", "root", "", "medicaldb");
if($mysqli->connect_error) {
  exit('Could not connect');
}
// This code runs an SQL query against the medicaldb, and returns the result in an HTML table:
$sql = "SELECT Patient.patient_id, Patient.patient_phone, CONCAT ('Dr. ', doctor.doctor_last_name) as DocName,
Appointment.date_id, Appointment.time_id, Appointment.room_number
FROM Appointment
	INNER JOIN Patient
		ON Patient.patient_id = Appointment.patient_id
	INNER Join Doctor
		On Doctor.doctor_id = Appointment.doctor_id
WHERE patient.patient_id = ?";


$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_GET['q']);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($pid, $pphone, $dname, $adate, $atime, $aroom);
$stmt->fetch();
$stmt->close();

echo "<table>";
echo "<tr>";
echo "<th>PatientID</th>";
echo "<td>" . $pid . "</td>";
echo "<tr>";
echo "<th>Patient's phone number</th>";
echo "<td>" . $pphone . "</td>";
echo "<tr>";
echo "<th>Doctor's Name</th>";
echo "<td>" . $dname . "</td>";
echo "<tr>";
echo "<th>Appointment Date</th>";
echo "<td>" . $adate . "</td>";
echo "<tr>";
echo "<th>Appointment Time</th>";
echo "<td>" . $atime . "</td>";
echo "<tr>";
echo "<th>Appointment Room</th>";
echo "<td>" . $aroom . "</td>";
echo "<tr>";
echo "</tr>";
echo "</table>";
?>
