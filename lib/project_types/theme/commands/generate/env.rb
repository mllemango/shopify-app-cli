module Theme
  module Commands
    class Generate
      class Env < ShopifyCli::SubCommand
        options do |parser, flags|
          parser.on('--env=ENV') { |env| flags[:env] = env }
        end

        def call(*)
          env = options.flags[:env]
          themeid = CLI::UI::Prompt.ask('theme id')
          store = ask_store
          password = ask_password

          Themekit.generate_env(ctx, store: store, password: password, themeid: themeid, env: env)
        end

        # def self.help
        #   ShopifyCli::Context.message('theme.generate.env.help', ShopifyCli::TOOL_NAME)
        # end

        private

        def ask_store
          CLI::UI::Prompt.ask('store')
        end

        def ask_password
          CLI::UI::Prompt.ask('password')
        end
      end
    end
  end
end
