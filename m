Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2216C00140
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Aug 2022 09:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Date:CC:To:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E083BtHBOzz0YO957wDIt/oQrCPcNDkdDbiO5fwVwiE=; b=FPsAhqrXowRPD7
	VnBOfBWFgvk30kD6vzSzfbPzllU7KXl2W4tb+M/5s5Ixx9ZrbjXcog/hL9fY5m9picjMBaL/RAUS5
	E7tMosc1jnvufXiniKvHNXTgyRpC0xThodRaN3dKJ1as30F+PVG13g6sbJRn7Hew0e/itiWPHFZVl
	iQU+k7xaHy2w4+J9AHGyyyZXhGJT3NWDqyi9bNlSGftyJez9Z2VyS16e98iT7xrOCPuih/2sbA1sd
	zZNGYWsvdvAZDXzsG85io4C2K6nKGz9L5NNpagJop4OdlUNOzwVRNbr1usIdJ1ViSTYz1kjN0x4U6
	1M47VH2qyBJ0KZqL4Nzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtSM-00DW8H-FA; Fri, 05 Aug 2022 09:17:23 +0000
Received: from mail-dm3nam02on2070.outbound.protection.outlook.com ([40.107.95.70] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtSJ-00DW3s-6e
	for linux-snps-arc@lists.infradead.org; Fri, 05 Aug 2022 09:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKPYTD5aHoaht6qAuIFHkgWU9RIOsavEsKDHK7S9z7e65y9UapjX+pscTfOStB1ySPgHFGq6Y8EiLsibgyyMToZrXqrlML7s6dWsJ/JrOxpc0b1Xi64PJ83Ls1jkSeAs+dRnUMn3g5wDv8LaNS49+45R/BvQ8SN2RBwARxnat/5W/pK6O3EJ/o9BsNEkM3zL1nEUm+B/ADI3YbzgThc4Okr3gWHQsafpAY1yyq1m6K8COdMdP1lqDrzuQqsoscDR8D4K7VnuTr+JqLmVSDtoyiX/msEaTVyahYVhficLqJO00WfvgqwyLvYrS3G4KOruVSW3UDRso0LZY8020opaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csXSVxJrCD0t3rywPoXLOLCcGGIswD6SjxG1B29fwvc=;
 b=ZcGB9vYdCU08iYteBSf9a/yCiPYwM7dvILtPLGxZy5Lc9wxWI6zRHTU+a2Ij52auNmuHzp7sfsGncyT0wcItMJAj1/i/I/m3M3CvQgu/QTCiLVGEItjq9PJSI0hY60B0MEa0wJLWpt4goi7E06kmoHWbZTOApGeih8zxFfCy8/mCjC/hQRNBpEHD5mI8+tN12T+sa+KE6s1U+jBVY7HPwHGKUbRSzfaXltLlyXJYi3vlrHnLauDQahLoWdHqVfpSLjlwmrVv9ujO3AhyycqukpYRrpK2TDoUBpOfn5fe4iXl/37aSEYv+AbkUuNMaZOqqyuMR7VnDaTCbNK4IZ5LJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.136.252.176) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=stryker.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=stryker.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csXSVxJrCD0t3rywPoXLOLCcGGIswD6SjxG1B29fwvc=;
 b=VP9jbTjW6/OcsXL82FxOctcaMHv59oLUDsUzwvfQNv07OQT7NxNeNoRlo/dFL9ItCvzY8ctuzw5XkjLGxeOnaIgO5QNKWTB8cIAdKNAoi2My89x5WwVajIHJME7Oq7ej5A+N/vVx80Al2yFyZKoduLtRuZsnsGWs+8fWHZsIXX1KvNruvw3FZNhsM3Qy4kemojUrNvrvAjK+IcUu5+hfNnBKfld71poLTyArLhm2ttEUVvPe1mbTFv6/+bXMnEIaHyYv4NnN0iFUCm91AE6pyeyOVzrEbcPlEgCo15khNPB8/7CCRRtOPSV9DBHC4TpuBulJJVBHQlT3eXqG5LEOHg==
Received: from MW4PR03CA0067.namprd03.prod.outlook.com (2603:10b6:303:b6::12)
 by BN8PR01MB5313.prod.exchangelabs.com (2603:10b6:408:b9::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Fri, 5 Aug 2022 09:17:14 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::22) by MW4PR03CA0067.outlook.office365.com
 (2603:10b6:303:b6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Fri, 5 Aug 2022 09:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.136.252.176)
 smtp.mailfrom=stryker.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=stryker.com;
Received-SPF: Pass (protection.outlook.com: domain of stryker.com designates
 64.136.252.176 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.136.252.176; helo=kzoex10b.strykercorp.com; pr=C
Received: from kzoex10b.strykercorp.com (64.136.252.176) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5504.14 via Frontend Transport; Fri, 5 Aug 2022 09:17:12 +0000
Received: from bldsmtp01.strykercorp.com (10.50.110.114) by
 kzoex10b.strykercorp.com (10.60.0.53) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Aug 2022 05:16:56 -0400
Received: from bldwoapp11 ([192.168.131.10]) by bldsmtp01.strykercorp.com with
 Microsoft SMTPSVC(8.5.9600.16384);	 Fri, 5 Aug 2022 03:16:49 -0600
MIME-Version: 1.0
From: <noreply@stryker.com>
To: <wos@stryker.com>
CC: <linux-snps-arc@lists.infradead.org>
Date: Fri, 5 Aug 2022 17:16:49 +0800
Subject: INVEST TODAY AND BECOME THE NEXT BILLIONAIRE...
Message-ID: <BLDSMTP01WF84KtG47k0011200f@bldsmtp01.strykercorp.com>
X-OriginalArrivalTime: 05 Aug 2022 09:16:49.0746 (UTC) FILETIME=[17F8EB20:01D8A8AC]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 486641b4-9a70-45f7-8904-08da76c3483c
X-MS-TrafficTypeDiagnostic: BN8PR01MB5313:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YwiXGR4T8wMoHvRane4TaFfkGjvX+eMiXHu4/T3Y1bk4wxHnaTjN+o9PIKCaTI7Ij09J3a6rLtqjUdofc/HZU68sc5gInCz5bUIb39xYBlGnGCwbNsKR/xroXNoeJB1lL+c9yCf2OAtIoEuENS8zM+j3mpDrZN4Ra6st8Et4HeqDoCkaQGFnUu0HEfywP716C9Lj03GoYkLuHa6A+V41O4y/hXwtrvETF5ZcdFZ2PQy/mZzlqKnjxUfXOQTip+osXXSVdwmV1f/nw0tssXttam0z8LYjIbpveJeBwhaEzmbxgylBHHEdfo4CxbpQtJTvvTH+zNjPgleID5aEAB0vVOPLfzdl4XquhZkJkjorDKu8Gc7gfnlxCP2SmdFmSq08vACoDc9Ev4ONQrWT/jB8Esg2SiIWzUIgaouZ1P6aRSKlABvOtXgGLj6jPkHtSxdnV1pUGJP8QcZHY0MCypbvJXueXXZAPmVbnMQ7zIfqVZ/O+aChy82+rghDYG9fTakWfZaugX+gD7O+EEC8XoAV4FlQNNI08i4KARRWgQgzU89V80o6MWncPYK7qt73Ql/rawvcPp0Vw3UIb5/lGcBESxXEUhVJd7dBqQJOeA6h3phhYszr19MnChxkzVr8kFPOMy/SriUXz9nStIcFs38bYHK58f8KqIC/lVebIXhKDeol+NgC/eoFR6BisQHqzuUoUDoFJmhB3RNwU1VelRFDohSWw52HVYTp6S4D2of61iOhwE9AFsKbOGHojGewHJgLx0xk+RiZJHjv+fWEEI0xaW7yVTX0yzu+u2iFlD5vMGpXFx2yOzocuoTXbxHG1jOJ
X-Forefront-Antispam-Report: 	CIP:64.136.252.176;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:kzoex10b.strykercorp.com;PTR:ip176-252-136-64.static.ctstelecom.net;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(316002)(40460700003)(336012)(47076005)(8936002)(81166007)(186003)(5660300002)(26005)(82740400003)(9686003)(356005)(6636002)(2906002)(2876002)(558084003)(70206006)(8676002)(4326008)(6862004)(70586007)(40480700001)(36860700001)(966005)(82310400005)(478600001)(41300700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 09:17:12.6629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486641b4-9a70-45f7-8904-08da76c3483c
X-MS-Exchange-CrossTenant-Id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4e9dbbfb-394a-4583-8810-53f81f819e3b;Ip=[64.136.252.176];Helo=[kzoex10b.strykercorp.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR01MB5313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021719_472592_E1BBFB45 
X-CRM114-Status: UNSURE (   2.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CRYPTOCURRENCY WILL MAKE YOU A BILLIONAIRE https://telegra.ph/Cryptocurrency-makes-people-millionaires-at-15-people-per-hour---Page-842785-08-02-3

Follow this link to read our Privacy Statement<https://www.stryker.com/content/stryker/gb/en/legal/global-policy-statement.html/>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
