class ProjectMailer < ApplicationMailer
  default from: "shumaseki40@gmail.com"
  def creation_email(task)
    @task = task
    mail(
      subject: "タスク作成完了メール",
      to: "user@example.com"
      
    )
  end
end
