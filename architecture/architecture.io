<mxfile host="app.diagrams.net" agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0" version="27.0.6">
  <diagram id="arch" name="Serverless Architecture">
    <mxGraphModel dx="1657" dy="820" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="stagingVPC" value="" style="rounded=1;strokeColor=#1E90FF;fillColor=#E6F2FF;" parent="1" vertex="1">
          <mxGeometry x="80" y="135" width="620" height="410" as="geometry" />
        </mxCell>
        <mxCell id="stAPI" value="API Gateway" style="rounded=1;strokeColor=#000000;fillColor=#FFFFFF;" parent="stagingVPC" vertex="1">
          <mxGeometry x="30.999999999999996" y="27.333333333333332" width="155" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-2" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="stLambdaUser" target="stDDB">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="stLambdaUser" value="User Config Lambda" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="215.74999999999997" y="30.00333333333333" width="170.5" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stDDB" value="DynamoDB" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="433.99999999999994" y="27.333333333333332" width="137.5625" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stEB" value="EventBridge" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="9.999999999999996" y="209.99666666666667" width="155" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stLambdaSched" value="Scheduler Lambda" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="207.99999999999997" y="209.99666666666667" width="185.99999999999997" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-3" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="stLambdaExec" target="stDDB">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="stLambdaExec" value="Execution Lambda" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="433.99999999999994" y="136.66666666666666" width="137.5625" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stSNS" value="SNS Topic" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="224.74999999999997" y="300.67" width="155" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stAudit" value="Audit Trail (S3)" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="433.99999999999994" y="246" width="137.5625" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="e6" style="edgeStyle=orthogonalEdgeStyle;rounded=0;exitX=0.563;exitY=0.984;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" parent="stagingVPC" source="stLambdaSched" target="stSNS" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="402.99999999999994" y="191.33333333333331" as="sourcePoint" />
            <mxPoint x="263.54920634920626" y="273.3333333333333" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-7" value="Staging VPC" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="stagingVPC">
          <mxGeometry x="394" y="364" width="160" height="30" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-10" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="3oXKzMy_ypGHyUnRM_5V-9">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="300" y="90" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-11" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="3oXKzMy_ypGHyUnRM_5V-9" target="stLambdaExec">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-15" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="3oXKzMy_ypGHyUnRM_5V-9" target="stLambdaSched">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-9" value="AWS Secrets Manager" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;strokeColor=#ffffff;fillColor=#232F3E;dashed=0;verticalLabelPosition=middle;verticalAlign=bottom;align=center;html=1;whiteSpace=wrap;fontSize=10;fontStyle=1;spacing=3;shape=mxgraph.aws4.productIcon;prIcon=mxgraph.aws4.secrets_manager;" vertex="1" parent="stagingVPC">
          <mxGeometry x="280.56" y="110" width="39.44" height="70" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-25" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.virtual_private_cloud;fillColor=#F58534;gradientColor=none;" vertex="1" parent="stagingVPC">
          <mxGeometry x="510" y="340" width="79.5" height="54" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-28" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.568;entryY=0.073;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="stagingVPC" source="stAPI" target="stEB">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="109" y="159" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-41" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="stagingVPC">
          <mxGeometry x="360" y="39" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-62" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="stagingVPC">
          <mxGeometry x="545.31" y="160.32999999999998" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-63" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="stagingVPC">
          <mxGeometry x="367.75" y="221.82999999999998" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="prodVPC" value="" style="rounded=1;strokeColor=#228B22;fillColor=#E8F5E9;" parent="1" vertex="1">
          <mxGeometry x="740" y="135" width="811" height="470" as="geometry" />
        </mxCell>
        <mxCell id="prAPI" value="API Gateway" style="rounded=1;strokeColor=#000000;fillColor=#FFFFFF;" parent="prodVPC" vertex="1">
          <mxGeometry x="40.49999999999999" y="26.666666666666664" width="202.50000000000003" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="prLambdaUser" value="User Config Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="283.49999999999994" y="26.666666666666664" width="243" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="prDDB" value="DynamoDB" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="566.9999999999999" y="26.666666666666664" width="202.50000000000003" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="prEB" value="EventBridge" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="40.49999999999999" y="173.33333333333331" width="202.50000000000003" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-17" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="prodVPC" source="prLambdaSched" target="prSNS">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="prLambdaSched" value="Scheduler Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="269.99999999999994" y="173.33333333333331" width="243" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-4" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="prodVPC" source="prLambdaExec" target="prDDB">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="prLambdaExec" value="Execution Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="567" y="133.34" width="223" height="53.34" as="geometry" />
        </mxCell>
        <mxCell id="prSNS" value="SNS Topic + Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="292.44" y="290" width="198.1216216216216" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="prAudit" value="Audit Trail (CloudTrail→S3)" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="567" y="240" width="213.72289156626505" height="53.33617021276596" as="geometry" />
        </mxCell>
        <mxCell id="e10" style="edgeStyle=orthogonalEdgeStyle;rounded=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" parent="prodVPC" source="prAPI" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="109.45945945945947" y="92.5" as="sourcePoint" />
            <mxPoint x="142.29729729729732" y="133.33333333333331" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-8" value="Production VPC" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="prodVPC">
          <mxGeometry x="602" y="357" width="100" height="30" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-19" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="prodVPC" source="3oXKzMy_ypGHyUnRM_5V-18" target="prLambdaUser">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="420" y="90" />
              <mxPoint x="405" y="90" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-23" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="prodVPC" source="3oXKzMy_ypGHyUnRM_5V-18">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="420" y="170" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-18" value="AWS Secrets Manager" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;strokeColor=#ffffff;fillColor=#232F3E;dashed=0;verticalLabelPosition=middle;verticalAlign=bottom;align=center;html=1;whiteSpace=wrap;fontSize=10;fontStyle=1;spacing=3;shape=mxgraph.aws4.productIcon;prIcon=mxgraph.aws4.secrets_manager;" vertex="1" parent="prodVPC">
          <mxGeometry x="400" y="95" width="39.44" height="65" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-21" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="prodVPC" source="3oXKzMy_ypGHyUnRM_5V-18" target="prLambdaExec">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="499.15999999999985" y="130" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-26" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.virtual_private_cloud;fillColor=#F58534;gradientColor=none;" vertex="1" parent="prodVPC">
          <mxGeometry x="702" y="333" width="79.5" height="54" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-64" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="prodVPC">
          <mxGeometry x="500.25" y="37.829999999999984" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-65" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="prodVPC">
          <mxGeometry x="763.75" y="155.67000000000002" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-67" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="prodVPC">
          <mxGeometry x="460" y="312.33" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-66" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.lambda_function;fillColor=#F58534;gradientColor=none;" vertex="1" parent="prodVPC">
          <mxGeometry x="486.25" y="184.5" width="26.25" height="31" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-78" value="" style="rounded=1;whiteSpace=wrap;html=1;fillColor=none;dashed=1;dashPattern=8 8;" vertex="1" parent="prodVPC">
          <mxGeometry x="12.5" y="170" width="500" height="70" as="geometry" />
        </mxCell>
        <mxCell id="e1" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stAPI" target="stLambdaUser" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e2" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stLambdaUser" target="stDDB" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e4" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stEB" target="stLambdaSched" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e5" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stLambdaSched" target="stLambdaExec" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e7" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stSNS" target="stAudit" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e8" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="prAPI" target="prLambdaUser" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e9" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="prLambdaUser" target="prDDB" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e11" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="prEB" target="prLambdaSched" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e12" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="prLambdaSched" target="prLambdaExec" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e14" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="prSNS" target="prAudit" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-34" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="3oXKzMy_ypGHyUnRM_5V-31" target="stagingVPC">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="425" y="64" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-31" value="GitLab" style="shape=rect;fillColor=#EE5396;aspect=fixed;resizable=0;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="366" y="40" width="48" height="48" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-32" value="" style="fillColor=#ffffff;strokeColor=none;dashed=0;outlineConnect=0;html=1;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;part=1;movable=0;resizable=0;rotatable=0;shape=mxgraph.ibm_cloud.logo--gitlab" vertex="1" parent="3oXKzMy_ypGHyUnRM_5V-31">
          <mxGeometry width="24" height="24" relative="1" as="geometry">
            <mxPoint x="12" y="12" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-40" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" edge="1" parent="1" source="3oXKzMy_ypGHyUnRM_5V-35" target="prodVPC">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1212" y="44" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-35" value="GitLab" style="shape=rect;fillColor=#EE5396;aspect=fixed;resizable=0;labelPosition=center;verticalLabelPosition=bottom;align=center;verticalAlign=top;strokeColor=none;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="1121" y="40" width="48" height="48" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-36" value="" style="fillColor=#ffffff;strokeColor=none;dashed=0;outlineConnect=0;html=1;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;part=1;movable=0;resizable=0;rotatable=0;shape=mxgraph.ibm_cloud.logo--gitlab" vertex="1" parent="3oXKzMy_ypGHyUnRM_5V-35">
          <mxGeometry width="24" height="24" relative="1" as="geometry">
            <mxPoint x="12" y="12" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-71" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.cloudwatch;fillColor=#759C3E;gradientColor=none;" vertex="1" parent="1">
          <mxGeometry x="790" y="390" width="82.5" height="93" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-72" value="" style="outlineConnect=0;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;shape=mxgraph.aws3.cloudwatch;fillColor=#759C3E;gradientColor=none;" vertex="1" parent="1">
          <mxGeometry x="140" y="420" width="82.5" height="93" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-73" value="Cloudwatch" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="151.25" y="510" width="60" height="30" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-74" value="Cloudwatch" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="800" y="480" width="60" height="30" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-75" value="" style="rounded=1;whiteSpace=wrap;html=1;fillColor=none;dashed=1;dashPattern=8 8;" vertex="1" parent="1">
          <mxGeometry x="102.5" y="150" width="577.5" height="80" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-76" value="" style="rounded=1;whiteSpace=wrap;html=1;fillColor=none;dashed=1;dashPattern=8 8;" vertex="1" parent="1">
          <mxGeometry x="760" y="160" width="780" height="70" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-77" value="" style="rounded=1;whiteSpace=wrap;html=1;fillColor=none;dashed=1;dashPattern=8 8;" vertex="1" parent="1">
          <mxGeometry x="90" y="330" width="390" height="80" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-79" value="" style="rounded=1;whiteSpace=wrap;html=1;fillColor=none;dashed=1;dashPattern=8 8;" vertex="1" parent="1">
          <mxGeometry x="1300" y="260" width="240" height="80" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-80" value="" style="rounded=1;whiteSpace=wrap;html=1;fillColor=none;dashed=1;dashPattern=8 8;" vertex="1" parent="1">
          <mxGeometry x="500" y="260" width="170" height="80" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-68" value="" style="rounded=0;whiteSpace=wrap;html=1;gradientColor=none;fillColor=none;" vertex="1" parent="1">
          <mxGeometry x="60" y="120" width="1510" height="530" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-70" value="aws-account" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="1460" y="620" width="91" height="30" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-81" value="" style="endArrow=none;dashed=1;html=1;rounded=0;" edge="1" parent="1">
          <mxGeometry width="50" height="50" relative="1" as="geometry">
            <mxPoint x="1360" y="709.5" as="sourcePoint" />
            <mxPoint x="1420" y="709.5" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-82" value="presents microservices&lt;div&gt;&lt;br&gt;&lt;/div&gt;" style="text;html=1;align=center;verticalAlign=middle;whiteSpace=wrap;rounded=0;" vertex="1" parent="1">
          <mxGeometry x="1411" y="705" width="150" height="20" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
