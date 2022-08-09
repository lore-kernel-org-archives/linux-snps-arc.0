Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922AC19F2D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Aug 2022 22:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Date:CC:To:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+MostY7hZl/d6pi6svTPe5NMror/52RBIj6lPPDn41w=; b=CMnq+OTfU332jx
	4kNuWvfLWWc4WMV3kB9VeezsgriI4fvXdEAbUp5nMXrqTVYME8dakyO33eG4iKA21GhP21vNX1fPB
	OqFFJAG8rvMNmvuneWGzNmkhn/A+Gxc8IRQf3q5X85WEXBrU7Obt6L8bfzbSAWTxhYoDPYE9JYQGk
	ts6WwV3sdyKSzI8bLXHvWGCFdf2fll7wFylzeOPWwIhrHq4PGteiE57+u2Nx3SI4peTU78BO0AUQv
	TtAN29yODlUJHCAQah9MQa+KMQBsRLOi8OjXEvnMPJigcY52MqA5v4yGj+wjLf0UJA0ciUnfHqSQg
	SKW6ZQnYqkwVa+a2y/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLYCO-007Bmx-2q; Tue, 09 Aug 2022 22:59:44 +0000
Received: from mail-bn7nam10on2052.outbound.protection.outlook.com ([40.107.92.52] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLYCK-007Bkn-Ry
	for linux-snps-arc@lists.infradead.org; Tue, 09 Aug 2022 22:59:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNNNflAe/FWdgVT7FN9jGy3gRmKGO3dgvDKez+XBuD3YvKxiGiNK5iuBfCLNfvTKs4lMd5hIyTj6Xu5iKnqigUtQlFqtsqSVmkZojJZM/7Mu9TAu2mGYFjKBNHz0kIJ2bkEH8zr4ICUDSaz6UHnv+Z+zJvWy6Wds+jqjaUfqQHp/xVu56EoUC3791ZvraNvJwUhZdK3RLowrIQlepAIoLrfJHTQB1vBO3ekBw0LEHWOZID5uUDZcCISQWWV+1C0bBfdXCewsrCCdt2e5XH1n6og/eaXlAKkQ9uSYrgxTKNMmhePlx/l2V/mmwEN2QNppgAv5e1nKcVUk0MjpMeerWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC63H69Y4RmnfeqZFa7l9XBZ8H1RINrXnDA9173rAZc=;
 b=Z7WuTRsgsvOh+T27hX+IpL32Pi5wR3NKOLATJtBctoyNHedYBIfMqQQWyAY3n34qU3U32L7gCRM92AItq54Oq7Js/7CgrsiVbUH5XGp1XCCH725GMNIraGIWs5PaRgXvTgMxPOw7gQb4F72mILPTUzx0/hTuYHPmUQDKnzMnPv65ktcsJ/tqWegLoRzLJbU83FgsKE6Ub7Bqw2Y6OlgCWbRhyIJzyhlf9BSelUdLdJcyzjvva9UuyocvbymlnxB5CJ9i4AuFOG4CqVkKA8smStxjMTxlvhUHnGS0FvTwo+TYKrwYZjs4t9Dwkb/nClsXYrNnwVKVX5UnTHdW8DsTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.136.252.176) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=stryker.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=stryker.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC63H69Y4RmnfeqZFa7l9XBZ8H1RINrXnDA9173rAZc=;
 b=IFF8CHIuCIfeppiatWe4FYG3NiNkHBTkswSfb0QB6vxB1zblxzb74wLLhPElE/gwVBVO/ZTqqCHw2m4LiCrLXZtOYrBNcj+YYbBRJ4/WTGiC1yqtDeXCOahNhV/7pTB1j0DN7jucysgrKOEZp3gSDJ85WvTG3hI58FHmbZ0mEHyezMy5xh4WliSgPuKsGh88nHFADMPjfFKMdeTeoqS+qyJO2xO7vanjy3ONhGYN36+Y7alM1GZq0oOgug0hQDnqWOpfRn+Mr02Equ97yjVl/Un4n6wpkiHbmTOkDP+dr6U2hZctPiaQYFtjt1mVp1TybzdGZxlrZof9nGWVIFWggA==
Received: from BN9PR03CA0874.namprd03.prod.outlook.com (2603:10b6:408:13c::9)
 by SA1PR01MB7390.prod.exchangelabs.com (2603:10b6:806:1f9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Tue, 9 Aug 2022 22:59:35 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::da) by BN9PR03CA0874.outlook.office365.com
 (2603:10b6:408:13c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Tue, 9 Aug 2022 22:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 64.136.252.176)
 smtp.mailfrom=stryker.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=stryker.com;
Received-SPF: Pass (protection.outlook.com: domain of stryker.com designates
 64.136.252.176 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.136.252.176; helo=kzoex10b.strykercorp.com; pr=C
Received: from kzoex10b.strykercorp.com (64.136.252.176) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 9 Aug 2022 22:59:34 +0000
Received: from bldsmtp01.strykercorp.com (10.50.110.114) by
 kzoex10b.strykercorp.com (10.60.0.53) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Aug 2022 18:59:27 -0400
Received: from bldwoapp11 ([192.168.131.10]) by bldsmtp01.strykercorp.com with
 Microsoft SMTPSVC(8.5.9600.16384);	 Tue, 9 Aug 2022 16:59:23 -0600
MIME-Version: 1.0
From: <noreply@stryker.com>
To: <wos@stryker.com>
CC: <linux-snps-arc@lists.infradead.org>
Date: Wed, 10 Aug 2022 06:59:22 +0800
Subject: Bitcoin wird Sie zum Milliardar machen
Message-ID: <BLDSMTP01u59Vvjvxo6001452b7@bldsmtp01.strykercorp.com>
X-OriginalArrivalTime: 09 Aug 2022 22:59:23.0666 (UTC) FILETIME=[AADA7720:01D8AC43]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f2df793-78fa-4eca-2b13-08da7a5ad421
X-MS-TrafficTypeDiagnostic: SA1PR01MB7390:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vAKjam+LqWJ4xAFElKVkXcUxoEx2X2LgekbIZRrrzcFR0vZSO8uySDJ0Y2MCXgb/vC9rp8e8uY+mD0U+HsS+AzvVutXJH9TelR+kj1lGREzHRThWOOGlNkA6sieBxH75GnPyXEc1gzSrXpWYYVQjF7E27klGHgU0jWhWl432hmTm8KeOOTqe6g3Kh5CYphfwAn0Q2zPmN/T5NjhEqBpD6SWjW2XVhKVjmvb8gUAsLFhLOa5VN357jjgsJisd5km2fa7RWSp1RrrTC5hOTLGgabH3YOEwPe8lsXQZSPC6luV6in/5wyYQYDCtOKC7b8iPm/YlnL3aJ7T6SD7/cp8z7PFzaY3zU4NGeJTtPILoJxScjtzVf6UCYUPyJgCkD2YPCpFqgu1xYLiQtUjdSNwdT2JDjssTihT3KzLcCZP2YfMXdY1D8Qc4jektFhWmP+7uxpad+IbyAgn4po57Jg4yRXywHKYcD6ye3dmFlwjHC/p4ty3c6GSgq+RElDiv4H2ZINbdoe8sxKKOJG3cYWz5qLP1EB+MXd7xTW/EHuGK2RDwRHO5tNAFXpd3pvfIOsA+MNJqnEDwmIe2qt370YsSRUICM3QiMgd4bVgYPCEZ9BDrRUubrKsFGrvhHCQevzWj90zkwLCvMfEHiT/JcfZHCdgcy5DB7sps2ROdInQkM8YcbvvurkvWQNS04oLEUyBzw92l9hF07DMyXqter0S30LGzuMVTVTf7/KwRRLyX/ZQABLWhPlxUvulJBYrq6zh4Kv/e7CQt5m59bu2jq9t8CjTRL+skU99VkdmpIdsqkf/y803jqTbSfxTNR4uFlZZp
X-Forefront-Antispam-Report: 	CIP:64.136.252.176;CTRY:US;LANG:de;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:kzoex10b.strykercorp.com;PTR:ip176-252-136-64.static.ctstelecom.net;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(40470700004)(46966006)(36840700001)(9686003)(356005)(2876002)(26005)(82740400003)(478600001)(5660300002)(336012)(41300700001)(40480700001)(2906002)(81166007)(8936002)(82310400005)(4326008)(966005)(70206006)(8676002)(6862004)(36860700001)(86362001)(6636002)(40460700003)(70586007)(186003)(558084003)(316002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 22:59:34.9216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2df793-78fa-4eca-2b13-08da7a5ad421
X-MS-Exchange-CrossTenant-Id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4e9dbbfb-394a-4583-8810-53f81f819e3b;Ip=[64.136.252.176];Helo=[kzoex10b.strykercorp.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_155941_143832_8A5D2840 
X-CRM114-Status: UNSURE (   2.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SW4gZGVyIFN0YWR0IEJvbm4gd3VyZGVuIG1laHIgYWxzIDQ3MyBNZW5zY2hlbiBNaWxsaW9uYXJl
IGh0dHBzOi8vdGVsZWdyYS5waC9QYXNzaXZlcy1FaW5rb21tZW4tdW5kLTc1MDAwMDAtRXVyby1h
dWYtS3J5cHRvd9CTwqRocnVuZy0yMzM4NDgtMDgtMDkNCkZvbGxvdyB0aGlzIGxpbmsgdG8gcmVh
ZCBvdXIgUHJpdmFjeSBTdGF0ZW1lbnQ8aHR0cHM6Ly93d3cuc3RyeWtlci5jb20vY29udGVudC9z
dHJ5a2VyL2diL2VuL2xlZ2FsL2dsb2JhbC1wb2xpY3ktc3RhdGVtZW50Lmh0bWwvPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
