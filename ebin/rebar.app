%% -*- mode: erlang;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 ft=erlang et

{application, rebar,
 [{description, "Rebar: Erlang Build Tool"},
  {vsn, "2.1.0-pre"},
  {modules, [ rebar,
              rebar_app_utils,
              rebar_base_compiler,
              rebar_cleaner,
              rebar_config,
              rebar_core,
              rebar_ct,
              rebar_deps,
              rebar_edoc,
              rebar_erlc_compiler,
              rebar_escripter,
              rebar_eunit,
              rebar_file_utils,
              rebar_log,
              rebar_otp_app,
              rebar_qc,
              rebar_require_vsn,
              rebar_shell,
              rebar_subdirs,
              rebar_templater,
              rebar_upgrade,
              rebar_utils,
              rebar_xref,
              getopt,
              mustache ]},
  {registered, []},
  {applications, [kernel,
                  stdlib,
                  sasl,
                  compiler,
                  crypto,
                  syntax_tools,
                  tools]},
  {env, [
         %% Default log level
         {log_level, error},

         %% any_dir processing modules
         {any_dir_modules, [
                            rebar_require_vsn,
                            rebar_deps,
                            rebar_subdirs,
                            rebar_templater,
                            rebar_cleaner
                           ]},

         %% Dir specific processing modules
         {modules, [
                   {app_dir, [{compile, [
                                        rebar_erlc_compiler,
                                        rebar_otp_app
                                        ]},

                             {'create-app', [
                                            rebar_templater
                                            ]},

                             {ct, [
                                  rebar_ct
                                  ]},

                             {escriptize, [
                                          rebar_escripter
                                          ]},

                             {eunit, [
                                     rebar_eunit
                                     ]},

                             {'get-deps', [
                                          rebar_deps
                                          ]},

                             {xref, [
                                    rebar_xref
                                    ]}
                             ]}
                   ]}
        ]}
 ]}.
