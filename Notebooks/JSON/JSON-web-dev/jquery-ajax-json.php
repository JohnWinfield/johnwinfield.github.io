<!-- The following project will demonstrate how a web page can fetch information from a
SQL DB with AJAX and convert into JSON Data -->
<!DOCTYPE html>
<html>
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
<body>

<h2>Show specific info from SQL DB in a table</h2>
<!-- The value number is the patient_id stored in the medicaldb -->
<!-- When a user selects a patient in the dropdown list above,
a function called showPatient() is executed.
The function is triggered by the onchange event: -->
<form action="">
  <select name="patients" onchange="showPatient(this.value)">
    <option value="">Select a patient:</option>
    <option value="1001">William Simmons</option>
    <option value="1002">Thomas Simmons</option>
    <option value="1003 ">Ford Hendrix</option>
    <option value="1004 ">Mike Bobay</option>
    <option value="1005 ">Harley Taylor</option>
    <option value="1006 ">Robert Irby</option>
    <option value="1007 ">Daniel Patton</option>
    <option value="1008 ">Jovany Cabrera</option>
    <option value="1009 ">LeBron James</option>
    <option value="1010 ">Kobe Bryant</option>
    <option value="1011 ">Jimmy Butler</option>
    <option value="1012">Josh Butterworth</option>
    <option value="1013">Steve Schmitt</option>
    <option value="1014">Winfield Taylor</option>
  </select>
</form>
<br>
<div id="txtHint">Patient's appointment info will be listed here...</div>
<!-- The showPatient() function does the following:
Check if a patient is selected
Create an XMLHttpRequest object
Create the function to be executed when the server response is ready
Send the request off to a file on the server
Notice that a parameter (q) is added to the URL (with the content of the dropdown list) -->
<script>
function showPatient(str) {
  var xhttp;
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "getpatient.php?q="+str, true);
  xhttp.send();
}
</script>
<br>

<!-- Convert SQL data into JSON Format -->
<div id="allPatients">
<h2>Show all info from SQL DB in JSON format</h2>
<button type="button" onclick="loadAllData()">Change Content</button>
</div>

<!-- The loadAllData() function does the following:
Create an XMLHttpRequest object
Create the function to be executed when the server response is ready
Send the request off to a file on the server -->
<script>
function loadAllData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("allPatients").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "getallpatients.php", true);
  xhttp.send();
}
</script>
</body>
</html>
