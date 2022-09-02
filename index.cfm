<!--- Please insert your code here --->
<cfif structKeyExists(url,'check') AND url.check EQ 1>
  <cfset variables.tes = createObject("component","test")/>
  <cfset variables.studentsData = variables.tes.saveStudentsData(Firstname=form.FirstName, LastName=form.LastName, Country=form.country)/>
  <cfoutput>#variables.studentsData.Firstname#</cfoutput>
<cfelse>
  <link rel="stylesheet" href="index.css"/>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js' integrity='sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==' crossorigin='anonymous'></script>
  <div class="container">
      <label for="fname">First Name</label>
      <input type="text" id="fname" name="firstname" placeholder="Your name..">

      <label for="lname">Last Name</label>
      <input type="text" id="lname" name="lastname" placeholder="Your last name..">

      <label for="country">Country</label>
      <select id="country" name="country">
        <option value="australia">Australia</option>
        <option value="canada">Canada</option>
        <option value="usa">USA</option>
      </select>

      <label for="subject">Subject</label>
      <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

      <button type="button" onclick="submit()">Submit</button>
  </div>
</cfif>
<script type="text/javascript">
function submit(){
   let fname=$("#fname").val();
   let lname=$("#lname").val();
   let country=$("#country").val();   
$.ajax({
    url: 'index.cfm?check=1',
    type: 'POST',
    data: {FirstName:fname, LastName:lname, Country:country},
    datatype:'json'
}).done({
  function(response){
  alert('Successfully saved your data' +response)
  }
}).fail({
  function(){
  alert('fail')
  }
})
}
</script>
