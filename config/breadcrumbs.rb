crumb :root do
  link "HOME", root_path
end

crumb :settings do
  link "設定", edit_settings_profiles_path
  parent :root
end

crumb :issues do
  link "プロフィール設定"
  parent :settings
end


crumb :accounts do
  link "アカウント設定"
  parent :settings
end

crumb :passwords do
  link "パスワード設定"
  parent :settings
end

crumb :articles do
  link "記事"
  parent :root
end

crumb :new do
  link "新規作成"
  parent :articles
end

crumb :edit do |edit|
  link edit.title, edit_article_path 
  link "編集"
  parent :articles
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
