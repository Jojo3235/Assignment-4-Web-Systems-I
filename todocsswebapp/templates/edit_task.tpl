%#template for editing a task
%#the template expects to receive a value for "no" as well a "old", the text of the selected ToDo item
<html>
% include('templates/head.tpl', title='Edit task '+ no)

<body>
<p>Edit the task with ID = {{no}}</p>
<form action="/edit/{{no}}" method="get">
<input type="text" name="task" value="{{old[0]}}" size="100" maxlength="100" placeholder="Type the description here...">
<select name="status">
<option>open</option>
<option>closed</option>
</select>
<br/>
<input type="submit" name="save" value="save">
</form>

% include('templates/footer.tpl')

</body>
</html>