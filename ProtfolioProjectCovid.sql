--Protfolio Project on Covid

--Show the Covid Death Table
SELECT *
from ProtfolioProjectOnCovid..CovidDeaths$
order by 3,4

--Show the Covid Vaccination Table
--SELECT * 
--from ProtfolioProjectOnCovid..CovidVaccinations$
--order by 3,4
-- Some Column selection
Select Location, date, total_cases, new_cases, total_deaths, population
From ProtfolioProjectOnCovid..CovidDeaths$
order by 1,2
--1. Total death and Death rate
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as  DeathRate
From ProtfolioProjectOnCovid..CovidDeaths$
Where location like '%desh%'
order by 1,2
--1.1 Total cases vs Population
Select Location, date,population, total_cases, (total_cases/population)*100 as  InfectionRate
From ProtfolioProjectOnCovid..CovidDeaths$
Where location like '%desh%'
order by 1,2

--2. Highest Infection rate with Population
Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as  PercentPopulationInfected
From ProtfolioProjectOnCovid..CovidDeaths$
Group by location, population
--Where location like '%desh%'
order by PercentPopulationInfected desc

--3. Highest DeathCount by country
Select Location, population, MAX(cast(total_deaths as int)) as TotalDeathCount
From ProtfolioProjectOnCovid..CovidDeaths$
Where continent is not null
Group by location, population
--Where location like '%desh%'
order by TotalDeathCount desc

--3.1 Highest DeathCount by continent (Upper middle income , Lower middle income, Low income, High income)
Select Location, population, MAX(cast(total_deaths as int)) as TotalDeathCount
From ProtfolioProjectOnCovid..CovidDeaths$
Where continent is null and (location != 'high income' And location !=  'Upper middle income' 
	And location != 'Lower middle income' And location != 'Low income')
Group by location, population
--Where location like '%desh%'
order by TotalDeathCount desc


--3.2. Highest DeathPercent with Population
Create View v_DeathPerCountry
as
Select Location, population, MAX(cast(total_deaths as int)) as TotalDeathCount, 
MAX((cast(total_deaths as int)/population))*100 as  DeathPercentPopulation
From ProtfolioProjectOnCovid..CovidDeaths$
Group by location, population
--Where location like '%desh%'
order by DeathPercentPopulation desc
Select *
From v_DeathPerCountry
-- GLOBAL NUMBERS

-- Death Rate increasing with time
Create View v_DeathIncreaseWorld
as
Select date,  SUM(new_cases) as Total_Cases, SUM( cast(new_deaths as int)) as Total_Deaths,
SUM( cast(new_deaths as int))/SUM(new_cases) as Death_Rate
From ProtfolioProjectOnCovid..CovidDeaths$ 
where continent is not null
group by date
order by 1,2
Select *
From v_DeathIncreaseWorld
-- Total Death Rate increasing with time
Create View v_TotalDeathWorld
as
Select  SUM(new_cases) as Total_Cases, SUM( cast(new_deaths as int)) as Total_Deaths,
SUM( cast(new_deaths as int))/SUM(new_cases) as Death_Rate
From ProtfolioProjectOnCovid..CovidDeaths$ 
where continent is not null
order by 1,2
Select *
From v_TotalDeathWorld
--access the second table
Select * 
From ProtfolioProjectOnCovid..CovidVaccinations$
--Join them with date and location
Select *
From ProtfolioProjectOnCovid..CovidDeaths$ dea
Join ProtfolioProjectOnCovid..CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date

--total percentage of vac in the world
Create View v_VacPerWorldDaily as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From ProtfolioProjectOnCovid..CovidDeaths$ dea
Join ProtfolioProjectOnCovid..CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--Order by 2,3
Select *
From v_VacPerWorldDaily
--total percentage of vac in the world with counter by location and date	
With PopvsVac (continent, location, date, population, new_vaccinations,RollingPepVac)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(cast(new_vaccinations as int))over (partition by dea.location order by dea.location , dea.date) 
 as RollingPepVac
From ProtfolioProjectOnCovid..CovidDeaths$ dea
Join ProtfolioProjectOnCovid..CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
--Order by 2,3
)
select *, (RollingPepVac/population)*100
From PopvsVac


--temp table
Drop Table if exists #PercentagePopVac
Create Table #PercentagePopVac
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPepVac numeric
)
Insert into	#PercentagePopVac
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(CONVERT(int, vac.new_vaccinations))over (partition by dea.location order by dea.location , dea.date) 
 as RollingPepVac
From ProtfolioProjectOnCovid..CovidDeaths$ dea
Join ProtfolioProjectOnCovid..CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.date
--where dea.continent is not null
--Order by 2,3
select *, (RollingPepVac/population)*100
From #PercentagePopVac

-- Creating VIEW
CREATE VIEW #PercentagePopVac as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.Location order by dea.location , dea.Date)
as RollingPepVac
From ProtfolioProjectOnCovid..CovidDeaths$ dea
Join ProtfolioProjectOnCovid..CovidVaccinations$ vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
--Order by 2,3
Select * 
From #PercentagePopVac