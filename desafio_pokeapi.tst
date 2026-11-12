---
parasoftVersion: 2026.2.0
productVersion: 10.7.6
schemaVersion: 13
suite:
  $type: TestSuite
  name: Test Suite
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - variables:
      - name: BASE_URL
        value: https://pokeapi.co/api/v2
      - name: DB_URL
        value: jdbc:postgresql://localhost:5432/pokemonDB
      - name: DB_USER
        value: postgres
      - name: DB_PASS
        maskValue: true
        value: AwAAACxFMzJuQVY5cGdlZk1rbFRnZ0tEdzUzYkgvUllSdkZKU3BBVTN6eXJhK3N3PQ==
      name: Local
      active: true
  lastModifiedBy: ed_de
  tests:
  - $type: TestSuite
    name: Escenario1
    testID: 1
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 2
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: Get Ditto
        outputTools:
        - $type: GenericDataBank
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/abilities[1]/item[1]/ability[1]/name[1]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/abilities[1]/item[1]/ability[1]/url[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: abilityName
              - customName: abilityUrl
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: root
              bodyType:
                $type: ComplexType
                attributes:
                - ns: ""
                  name: type
                  fixed: object
                  contentType:
                    $type: StringType
                  required: true
                name: rootType
                compositor: true
                compositorObj:
                  $type: AllCompositor
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: ""
              bodyType:
                $type: ComplexType
                name: anonymous
                compositor: true
                compositorObj:
                  $type: SequenceCompositor
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASE_URL}/pokemon/ditto"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: ditto
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: RESTClientToolTest
      name: REST Client
      testID: 3
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: Get Abilities
        outputTools:
        - $type: GenericAssertionTool
          iconName: XMLAssertor
          name: Descripcion habilidad
          wrappedTool:
            $type: XMLAssertionTool
            iconName: XMLAssertor
            name: XML Assertor
            errorsOutput:
              name: Errors
            assertions:
            - $type: RegexAssertion
              timestamp: 1794454966294
              name: Regular Expression Assertion
              extractEntireElement: true
              Assertion_XPath: /root/effect_entries/item/effect/string()
              value:
                name: Regular Expression Assertion
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: (?s).+
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: abilityUrl
          parameterizedValue:
            column: abilityUrl
          selectedIndex: -2
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: abilityName
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
  - $type: TestSuite
    name: Escenario2
    testID: 4
    dataSources:
    - id: ds_1361796461_1794457845952_1633353409
      impl:
        $type: CSVDataSource
        file: true
        fileObj:
          resolveVariablePath: true
          backupPath: data\pokemon.csv
          path: "${project_loc:desafio_pokeapi}/data/pokemon.csv"
        data: true
        columnNames:
        - PokemonName
        - ExpectedType
      name: Pokemons
      useAllRows: true
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 5
      tool:
        $type: RESTClient
        dataSourceNames:
        - Pokemons
        iconName: RESTClient
        name: Get Pokemon
        outputTools:
        - $type: GenericAssertionTool
          dataSourceNames:
          - Pokemons
          iconName: XMLAssertor
          name: Tipo Pokemon
          wrappedTool:
            $type: XMLAssertionTool
            dataSourceNames:
            - Pokemons
            iconName: XMLAssertor
            name: XML Assertor
            errorsOutput:
              name: Errors
            assertions:
            - $type: ValueAssertion
              timestamp: 1794459393186
              name: Value Assertion
              extractEntireElement: true
              Assertion_XPath: "/root/types/item[1]/type/name/string()"
              value:
                name: Value
                value:
                  fixedValue:
                    $type: StringTestValue
                  parameterizedValue:
                    column: ExpectedType
                  selectedIndex: -2
            message:
              $type: ExpectedXMLMessage
              message: true
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASE_URL}/pokemon/${PokemonName}"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: ExpectedType
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
            parameterizedValue:
              column: PokemonName
            selectedIndex: -2
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
  - $type: TestSuite
    name: Escenario3
    testID: 6
    testLogicVariables:
    - $type: TestLogicString
      name: weightKg
      value:
        $type: TestLogicVariableString
        useLocalValue: true
        originalValue: ""
        value: ""
    tests:
    - $type: RESTClientToolTest
      name: REST Client
      testID: 7
      tool:
        $type: RESTClient
        iconName: RESTClient
        name: Get Snorlax
        outputTools:
        - $type: GenericDataBank
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "/root/weight[1]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - customName: weightHg
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        constrainToSchema: false
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        validResponseRange:
          validResponseRange:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              validResponseRange: 200
        router:
          values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            HTTPClient_Endpoint: "${BASE_URL}/pokemon/snorlax"
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: abilityName
        mode: Literal
        literalQuery:
          isPropertiesRef: true
        literalPath:
          pathElements:
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: pokemon
          - values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              value: snorlax
        resourceMethod:
          httpMethod: GET
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: ToolTest
      name: Extension Tool
      testID: 8
      tool:
        $type: MethodTool
        iconName: Method
        name: Convertir a Kilo
        method:
          hasCode: true
          code:
            $type: ScriptCode
            input:
              useText: true
              textInput:
                $type: ScriptingTextInput
                text: "import com.parasoft.api.*\r\n\r\ndef convertirAKg(input, context)\
                  \ {\r\n    def pesoHg = context.getValue(\"Generated Data Source\"\
                  , \"weightHg\")\r\n    def pesoKg = Double.parseDouble(pesoHg) /\
                  \ 10\r\n\r\n    context.setValue(\"weightKg\", String.valueOf(pesoKg))\r\
                  \n    Application.showMessage(\"Peso: \" + pesoKg + \" kg\")\r\n\
                  \r\n    return String.valueOf(pesoKg)\r\n}"
          hasMethodId: true
          methodId:
            $type: ScriptMethodIdentifier
            functionName: convertirAKg
            arguments:
            - java.lang.Object
            - java.lang.Object
          useDataSource: true
      writeInput: true
      inputType: InputUsable
      input:
        use: 1
        text:
          text: ""
          type: text/plain
        dataSource:
          columnName: "Test 1: weight"
  - $type: TestSuite
    name: Escenario4
    testID: 9
    testLogicVariables:
    - $type: TestLogicString
      name: nombrePokemon
      value:
        $type: TestLogicVariableString
        useLocalValue: true
        originalValue: Chikorita
        value: Chikorita
    tests:
    - $type: ToolTest
      name: Data Generator Tool
      testID: 10
      tool:
        $type: DataGeneratorTool
        iconName: DataGeneratorTool
        name: Generar Id y Fecha
        generators:
        - $type: NumberGenerator
          min:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              min: 1
          max:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              max: 999999999
          name: idTransaccion
        - $type: DateTimeGenerator
          inputFormat:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              inputFormat: yyyy-MM-dd hh:mm:ss a
          outputFormat:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              outputFormat: yyyy-MM-dd hh:mm:ss
          name: fecha
        virtualDSCreator:
          writableColumns:
          - customName: idTransaccion
          - customName: fecha
    - $type: ToolTest
      name: DB Tool
      testID: 11
      tool:
        $type: DbTool
        iconName: DBTool
        name: Agregar Pokemon
        magicToken:
          fixedValue:
            $type: StringTestValue
            value: GO
        outputProviders:
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            name: SQL Query
          xmlResponseOutput:
            $type: NamedXMLToolOutputProvider
            name: Results as XML
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        sqlQuery:
          fixedValue:
            $type: StringTestValue
            useMultipleLines: true
            value: "INSERT INTO captura_pokemon (id_transaccion, nombre_pokemon, fecha)\
              \ \nVALUES ('${idTransaccion}', '${nombrePokemon}', '${fecha}')"
        failOnSQLException: true
        account:
          local:
            $type: DbConfigSettings
            password: AwAAACxybkVISDYxcVVrcm1SR2ZUQXRxTWV0eHFrOGkyNit6eHo1TVhIemhoSEY4PQ==
            uri: "${DB_URL}"
            username: "${DB_USER}"
            driver: org.postgresql.Driver
    - $type: ToolTest
      name: DB Tool
      testID: 12
      tool:
        $type: DbTool
        iconName: DBTool
        name: Validacion
        magicToken:
          fixedValue:
            $type: StringTestValue
            value: GO
        outputProviders:
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            name: SQL Query
          xmlResponseOutput:
            $type: NamedXMLToolOutputProvider
            outputTools:
            - $type: XMLAssertionTool
              iconName: XMLAssertor
              name: Verificar
              errorsOutput:
                name: Errors
              assertions:
              - $type: NumericAssertion
                timestamp: 1794504952503
                name: Numeric Assertion
                Assertion_XPath: /results/resultSet/rows/row/count
                value:
                  name: Numeric
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 1
              message:
                $type: ExpectedXMLMessage
                message: true
            name: Results as XML
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
            name: Traffic Object
        sqlQuery:
          fixedValue:
            $type: StringTestValue
            useMultipleLines: true
            value: "   SELECT count(*) FROM captura_pokemon WHERE id_transaccion =\
              \ '${idTransaccion}'"
        failOnSQLException: true
        account:
          local:
            $type: DbConfigSettings
            password: AwAAACxybkVISDYxcVVrcm1SR2ZUQXRxTWV0eHFrOGkyNit6eHo1TVhIemhoSEY4PQ==
            uri: "${DB_URL}"
            username: "${DB_USER}"
            driver: org.postgresql.Driver
