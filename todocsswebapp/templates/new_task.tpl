%#template for the form for a new task
<html>
% include('templates/head.tpl', title='New task')
<body>
<p>Add a new task to the ToDo list:</p>
<form action="/new" method="get">
<input type="text" size="100" maxlength="100" name="task" placeholder="Type a new task here...">
<input type="submit" name="save" value="save">
</form>
% include('templates/footer.tpl')
</body>
</html>