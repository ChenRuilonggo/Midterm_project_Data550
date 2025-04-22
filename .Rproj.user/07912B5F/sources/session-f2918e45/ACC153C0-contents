install:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore()"
	
REPORT_HTML = report/final_report.html
REPORT_RMD = report/final_report.Rmd

# final output
PLOTS = \
  output/foul_pts_plot.png \
  output/effective_field_goal_percentage.png \
  output/field_goal_percentage.png \
  output/three_point_percentage.png \
  output/Total\ Rebounds\ by\ Position.png \
  output/Offensive\ Rebounds\ by\ Position.png \
  output/Defensive\ Rebounds\ by\ Position.png \
  output/Blocks\ by\ Position.png \
  output/Steals\ by\ Position.png \
  output/assists_vs_turnovers.png

TABLES = \
  output/top_players.csv \
  output/position_performance.csv \
  output/shooting\ efficiency.csv \
  output/team_summary_stats.csv \
  output/top_scoring_teams.csv \
  output/best_defensive_teams.csv \
  output/free_throw_summary.rds \
  output/top_ft_shooters.rds

DEPENDENCIES = $(PLOTS) $(TABLES)

Dependency_overall =  \
  output/top_players.csv \
  output/position_performance.csv \
  
Dependency_ft = output/free_throw_summary.rds output/top_ft_shooters.rds output/foul_pts_plot.png

Dependency_se = output/shooting efficiency.csv effective_field_goal_percentage.png output/field_goal_percentage.png output/three_point_percentage.png

Dependency_rd = output/Total\ Rebounds\ by\ Position.png output/Offensive\ Rebounds\ by\ Position.png output/Defensive\ Rebounds\ by\ Position.png output/Blocks\ by\ Position.png output/Steals\ by\ Position.png

Dependency_tc = output/team_summary_stats.csv output/top_scoring_teams.csv output/best_defensive_teams.csv

Dependency_turnover = output/assists_vs_turnovers.png
# main rule
$(REPORT_HTML): $(REPORT_RMD) $(DEPENDENCIES)
	Rscript -e "rmarkdown::render('$<', output_file = 'final_report.html', output_dir = 'report')"

# dependencies
$(Dependency_overall): scr/Overall_analysis.R
	Rscript $<

$(Dependency_ft): scr/free_throw.R
	Rscript $<

$(Dependency_se): scr/shooting_efficiency.R
	Rscript $<

$(Dependency_rd): scr/rebounding_defense_member2.R
	Rscript $<

$(Dependency_tc): scr/Team_contributions.R
	Rscript $<

$(Dependency_turnover): scr/turnovers.R
	Rscript $<


.PHONY: report clean all

report: $(REPORT_HTML)

clean:
	rm -f $(REPORT_HTML) $(DEPENDENCIES)