<mxfile host="app.diagrams.net" agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0" version="27.0.6">
  <diagram id="arch" name="Serverless Architecture">
    <mxGraphModel dx="1657" dy="820" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="stagingVPC" value="Staging VPC" style="rounded=1;strokeColor=#1E90FF;fillColor=#E6F2FF;" parent="1" vertex="1">
          <mxGeometry x="20" y="20" width="620" height="410" as="geometry" />
        </mxCell>
        <mxCell id="stAPI" value="API Gateway" style="rounded=1;strokeColor=#000000;fillColor=#FFFFFF;" parent="stagingVPC" vertex="1">
          <mxGeometry x="30.999999999999996" y="27.333333333333332" width="155" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-2" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="stLambdaUser" target="stDDB">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="stLambdaUser" value="User Config Lambda" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="216.99999999999997" y="27.333333333333332" width="170.5" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stDDB" value="DynamoDB" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="433.99999999999994" y="27.333333333333332" width="137.5625" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stEB" value="EventBridge" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="30.999999999999996" y="136.66666666666666" width="155" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stLambdaSched" value="Scheduler Lambda" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="216.99999999999997" y="136.66666666666666" width="185.99999999999997" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-3" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="stagingVPC" source="stLambdaExec" target="stDDB">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="stLambdaExec" value="Execution Lambda" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="433.99999999999994" y="136.66666666666666" width="137.5625" height="54.666666666666664" as="geometry" />
        </mxCell>
        <mxCell id="stSNS" value="SNS Topic" style="rounded=1;" parent="stagingVPC" vertex="1">
          <mxGeometry x="216.99999999999997" y="246" width="155" height="54.666666666666664" as="geometry" />
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
        <mxCell id="prodVPC" value="Production VPC" style="rounded=1;strokeColor=#228B22;fillColor=#E8F5E9;" parent="1" vertex="1">
          <mxGeometry x="680" y="20" width="810" height="400" as="geometry" />
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
          <mxGeometry x="40.49999999999999" y="133.33333333333331" width="202.50000000000003" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="prLambdaSched" value="Scheduler Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="283.49999999999994" y="133.33333333333331" width="243" height="53.33333333333333" as="geometry" />
        </mxCell>
        <mxCell id="3oXKzMy_ypGHyUnRM_5V-4" value="" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="prodVPC" source="prLambdaExec" target="prDDB">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="prLambdaExec" value="Execution Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="567" y="133.34" width="223" height="53.34" as="geometry" />
        </mxCell>
        <mxCell id="prSNS" value="SNS Topic + Lambda" style="rounded=1;" parent="prodVPC" vertex="1">
          <mxGeometry x="283.5" y="240" width="198.1216216216216" height="53.33333333333333" as="geometry" />
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
        <mxCell id="e13" style="edgeStyle=orthogonalEdgeStyle;rounded=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" parent="prodVPC" target="prSNS" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="415.94594594594594" y="187.5" as="sourcePoint" />
            <mxPoint x="342.06081081081084" y="266.66666666666663" as="targetPoint" />
            <Array as="points">
              <mxPoint x="383.1081081081082" y="187.5" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="e1" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stAPI" target="stLambdaUser" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e2" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" source="stLambdaUser" target="stDDB" edge="1">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="e3" style="edgeStyle=orthogonalEdgeStyle;rounded=0;" parent="1" target="stEB" edge="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="100" as="sourcePoint" />
            <Array as="points">
              <mxPoint x="129" y="100" />
            </Array>
          </mxGeometry>
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
        <mxCell id="footer" value="Baseline Services: CloudTrail, S3/Glacier, KMS, IAM, SQS (DLQ), CloudWatch, X-Ray" style="text;html=1;strokeColor=none;fillColor=none;fontSize=12;align=center;" parent="1" vertex="1">
          <mxGeometry x="220" y="450" width="820" height="40" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
