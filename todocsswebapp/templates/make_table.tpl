<html>
% include('templates/head.tpl', title='Show open tasks')
<body>
%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)
<p>The open items are as follows:</p>
<table>
%for row in rows:
  <tr>
  %for col in row:
    <td>{{col}}</td>
  %end
  <td class="centered"><a href="/edit/{{row[0]}}">edit</a></td>
</tr> 
%end
</table>

<p>Create a new task <a href="/new">here</a></p>

% include('templates/footer.tpl')
</body>
</html>