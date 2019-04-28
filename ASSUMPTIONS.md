# Nanoevent Assumption

For the first mvp, this is my assumption

- Event has a capacity, that can decreased when we assigned it to ticket quota's.
For further development, we need to keep the value of capacity and add one more field to held how many capacity that already assigned to ticket.

- I didnt make customer endpoint, with limited time, I assume this mvp used by chosen person that's mean currently 
we can prioritize functional requirement first. 

- Database that I configure can be sqlite or postgres, so whoever can contribute by only using sqlite db.

- When customer buy some type of tickets and one of them are not available as demand, I choose to make all the transaction fail

- When api get called to buy some tickets with some fields of `same tickets`, it wont checked by validator 
because I didnt prioritize with that case. I thought that request from frontend will be grouped by ticket types.

- Every transaction purchase, I assume that it already being paid.