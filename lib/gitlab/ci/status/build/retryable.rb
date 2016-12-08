module Gitlab
  module Ci
    module Status
      module Status
        class Retryable < SimpleDelegator
          extend Status::Extended

          def has_action?(current_user)
            can?(current_user, :update_build, subject)
          end

          def action_icon
            'repeat'
          end

          def action_path
            retry_namespace_project_build_path(subject.project.namespace, subject.project, subject)
          end

          def action_method
            :post
          end

          def self.matches?(build)
            build.retryable?
          end
        end
      end
    end
  end
end
