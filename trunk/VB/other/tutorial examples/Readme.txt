AutoFill - Automatic string fill demo
Copyright (c) 1997 SoftCircuits Programming (R)
Redistributed by Permission.

This Visual Basic 5 example demonstrates how you can use a combo box
to implement an "autofill" feature. Autofill attempts to enter the
remainder of the string the user is typing. A combo box is used
because they implement both a text box and a list. The code finds the
first item in the list that begins with the text entered so far. It
then appends the remainder of the matching list item to the text in
the text box.

The appended characters not typed by the user are highlighted. This
way, any new keystrokes typed by the user automatically replace them,
thereby not getting in the way of normal typing. Code is also added
to make exceptions to certain keystrokes such as Delete and
Backspace.

This program may be distributed on the condition that it is
distributed in full and unchanged, and that no fee is charged for
such distribution with the exception of reasonable shipping and media
charged. In addition, the code in this program may be incorporated
into your own programs and the resulting programs may be distributed
without payment of royalties.

This example program was provided by:
 SoftCircuits Programming
 http://www.softcircuits.com
 P.O. Box 16262
 Irvine, CA 92623
