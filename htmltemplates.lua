local templates = {}

-- Individual Pages

templates.header =	[[
<!DOCTYPE html>
<html>
	
<head> 
<meta name=viewport content="width=device-width, initial-scale=1" charset="UTF-8">
<link rel="icon" type="image/png" href="https://static.glitchvid.com/favicon.png">
<link rel="stylesheet" href="../styles.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
<title>
			]]

templates.headertail =	[[

</title>
</head>
]]

templates.bodycontenthead =	[[
<body bgcolor="#1a1a1a">
<h1 class="gvidnet">
			]]

templates.bodycontenttail =	[[

</h1>

]]

templates.linkboxbegin =	[[
<div class="linkbox">

]]

templates.linkboxtail =	[[

</div>
]]

templates.tail =	[[

</body>
</html>
]]

templates.section =	[[
<section class="links" id="$TIMESCALEENGLISH">
	<a href="#$TIMESCALEENGLISH">
		<h4>
			$TIMESCALEENGLISH
		</h4>
	</a>
	<ul class="list">
		<li>
			<iframe src="https://grafana.nacl.glitchvid.com/d-solo/39mqm44Zz/render-template-dashboard?orgId=2&refresh=5m&var-interval=5m&from=$FROM&to=$TO&panelId=$PANELID" width="817" height="240" frameborder="0"></iframe>
		</li>
	</ul>
</section>
]]

-- Landing Page

templates.index = {}
local index = templates.index

index.header = [[
<!DOCTYPE html>
<html>
	
<head> 
<meta name=viewport content="width=device-width, initial-scale=0.75" charset="UTF-8">
<meta name="robots" content="noindex">
<link rel="icon" type="image/png" href="https://static.glitchvid.com/favicon.png">
<link rel="stylesheet" href="styles.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">

<title>NACL STATS</title>
</head>

<body bgcolor="#1a1a1a">
	<h1 class="gvidnet">
			NACL STATS
	</h1>
	
	<div class="linkbox">
		<section class="links">
			<h4>
				SYSTEM HEALTH
			</h4>
			<div class="flex-container">
					<div class="flex-graphs"><iframe src="https://grafana.nacl.glitchvid.com/d-solo/39mqm44Zz/render-template-dashboard?orgId=2&refresh=5m&var-interval=5m&from=now-30s&to=now&panelId=8" width="148" height="148" frameborder="0"></iframe></div>
					<div class="flex-graphs"><iframe src="https://grafana.nacl.glitchvid.com/d-solo/39mqm44Zz/render-template-dashboard?orgId=2&refresh=5m&var-interval=5m&from=now-24h&to=now&panelId=9" width="148" height="148" frameborder="0"></iframe></div>
					<div class="flex-graphs"><iframe src="https://grafana.nacl.glitchvid.com/d-solo/39mqm44Zz/render-template-dashboard?orgId=2&refresh=5m&var-interval=5m&from=now-24h&to=now&panelId=10" width="512" height="148" frameborder="0"></iframe></div>
					<div class="flex-graphs"><iframe src="https://grafana.nacl.glitchvid.com/d-solo/39mqm44Zz/render-template-dashboard?orgId=2&refresh=5m&var-interval=5m&from=now-24h&to=now&panelId=11" width="512" height="148" frameborder="0"></iframe></div>
			</div>
	</div>
]]

index.footer = [[

	<table width=100% height=100%>
			<tr tabrow> 
			<td style="text-align: center;vertical-align: middle;border-top: dotted;border-top-width: 1px;border-color: #272727;">
			<br>
			<h4>
				RETURN HOME:
			</h4>
			<gcomlink>
					<a href="http://glitchvid.com">Glitchvid.com</a>
			</gcomlink>
			</td>
			</tr>
			</table>

</body>
</html>
]]

index.linkboxhead = [[
		<div class="linkbox">
				<section class="links">
]]

index.linkboxtail = [[

				</section>
			</div>
]]

index.flexcontainerhead = [[
				<div class="flex-container">
]]

index.flexcontainertail = [[

				</div>
]]

index.flexgraph = [[
					<div class="flex-$FLEXTYPE">
						<h4> <a href="latency/$URL"> $PANELNAME </a> </h4>
						<iframe src="https://grafana.nacl.glitchvid.com/d-solo/39mqm44Zz/render-template-dashboard?orgId=2&refresh=5m&var-interval=5m&from=now-24h&to=now&panelId=$PANELID" width="512" height="148" frameborder="0"></iframe>
					</div>
]]

index.h4transit = [[
			<h4>
					TRANSIT LATENCY
			</h4>
]]

index.h4exchange = [[			
			<h4>
					EXCHANGE LATENCY
			</h4>
]]

index.h4endpoint = [[			
			<h4>
					ENDPOINT LATENCY
			</h4>
]]

return templates