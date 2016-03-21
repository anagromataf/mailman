defmodule Mailman.EexComposer do
  @moduledoc "Provides functions for rendering from Eex template files"

  def compile_part(config, :subject, %{subject: template, data: data}) do
    if config.subject_file do
      EEx.eval_file Path.join(config.subject_file_path, template), data
    else
      case data do
        %{} -> template
        _ -> EEx.eval_string template, data
      end
    end
  end

  def compile_part(config, :html, %{html: template, data: data}) do
    if config.html_file do
      EEx.eval_file Path.join(config.html_file_path, template), data
    else
      case data do
        %{} -> template
        _ -> EEx.eval_string template, data
      end
    end
  end

  def compile_part(config, :text, %{text: template, data: data}) do
    if config.text_file do
      EEx.eval_file Path.join(config.text_file_path, template), data
    else
      case data do
        %{} -> template
        _ -> EEx.eval_string template, data
      end
    end
  end

  def compile_part(_config, :attachment, attachment) do
    attachment.data
  end
end

