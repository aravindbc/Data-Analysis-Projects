### Overview
This project analyzes Uber trips in New York, providing insights into travel patterns and peak hours. It explores various aspects, such as the busiest days and hours, shedding light on the utilization of Uber services in a densely populated urban setting.

### Technologies Used
- Jupyter Notebook
- Python libraries: pandas, matplotlib.pyplot, seaborn

### Dataset
- Uber trips dataset
The dataset contains data of about 4.5 million uber pickups in New York City from April to September and 14.3 million pickups from January to June 2015. You can do so much more with this dataset rather than just analyzing it. But for now, in the section below, I will take you through Uber Trips analysis using Python.
The data contains date and time, latitude and longitude, and a Base columns.
- Date/Time: This column represents the date and time when each Uber trip occurred. In the format "MM-DD-YY HH:MM", it indicates the month, day, year, hour, and minute of the trip.
- Lat: This column contains the latitude coordinate of the location where the Uber trip started. Latitude measures the distance north or south of the equator and is used to pinpoint a specific location on the Earth's surface.
- Lon: This column contains the longitude coordinate of the location where the Uber trip started. Longitude measures the distance east or west of the Prime Meridian and is used to pinpoint a specific location on the Earth's surface.
- Base: This column represents the base code or identifier for the Uber driver or vehicle. Different bases may indicate different groups of drivers, vehicles, or service types.

### Key Insights
**Answers to the Questions** 
1. Which day the Uber trips were highest?
    By looking at the daily trips we can say that the Uber trips are rising on the working days and decreases on the weekends.
    
2. Find peak hours for uber trips during the day
    According to the hourly data, the Uber trips decreases after midnight and then start increasing after 5 am and the trips keep rising till 6 pm such that 6 pm is the busiest hour for Uber then the trips start decreasing.
    
3. Analyze the trip frequency by days of the week    
    In the above figure 0 indicates Sunday, on Sundays the Uber trips and more than Saturdays so we can say people also use Uber for outings rather than for just going to work. On Saturdays, the Uber trips are the lowest and on Mondays, they are the highest.


**Summary**
- Monday is the most profitable day for Uber
- On Saturdays less number of people use Uber
- 6 pm is the busiest day for Uber
- On average a rise in Uber trips start around 5 am.
- Most of the Uber trips originate near the Manhattan region in New York.
