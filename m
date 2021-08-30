Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ED2C4320A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11E860F44
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D11E860F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6z445I1I/cZInw0dax5/V7hsmWTMmynOp1gjJCIkwJ0=; b=IfNl8M5JKiMlXT
	W0yk02xeoChbbQrW2NApzpCEZryYulEK8aH/GF9TEwp9w6kuYdTWcIOdYDyif1535FSS95cOiqxh8
	wNAHlx25w8HlrBwSSvCi7B2JyJ+yvxA84XR4DkPbs7aMJmgeF83yUh26sHMtpWwaI+LU3YrlPUe/w
	VaXOGm5RwXtujLUTrtSHau2dJiOMPPvGVrzuAMfpL1WKpk16nTfRZuPcBWh4zVIl7nE8ad1O5CMrP
	cSSJDLdvx8brsi9afEtfPtcbo0Byqc+f2/hikohTn9xOCKBHQ+AsGcz+anZW/Kgn2V+hbIXGuvpcb
	0RNE2PBi7ZIuhRCTBFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkdz-0008iA-A3; Mon, 30 Aug 2021 17:00:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkHf-0005oN-IF
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 16:37:23 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2CFC540552;
 Mon, 30 Aug 2021 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1630341436; bh=tMMnqnoRnrZJip01ApUd7Cifh9QkB3xina2UAt3c3yQ=;
 h=From:To:CC:Subject:Date:From;
 b=lOQcvObW9lLt8gUyaxmB6HKfb1g79W9+hcNqdmJZWF/5BSP1rjKq8sgyfNXK+NzNv
 rTy+VOsHD1RRSsv60iEtxjNXgTlLqIBfADSbN+qyQWeWJSGMZi27jWLcu8/ftnnJk8
 6tFOev4lftqcY2Sk5acn25shyEumNtci3byiPzZelcq3RCPpeQEn7Mvhtss8QRYGG2
 Idemq9G0LaNDPr6foMRPc3pj1f+KYLIYTFUlT1PwNZ2VrgiJhJxHjpyyHXdaAgfPUB
 M5odez5D20ooxlPRczA9LabAIRWQB47P21dq6lZFysLqY5DB/RTHgVpYCkB2vmM5OS
 wJbboqIOY7gaQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 941F4A009C;
 Mon, 30 Aug 2021 16:37:13 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E14B6400A0;
 Mon, 30 Aug 2021 16:37:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YdTEgM7C";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La4dyiPVVOZD53HL6bBL1nj6cdTyTE5VqMAQ0rjcfKsbMQd4bKLxPE0oCmO219Za6WORN3lA71i+hnORBUCVq24KbMJrnxFsqnsGlYHak6GfmrGK2PgEqzl2PT+/aczRtLUEomYaMV1PJQAPZyoNlapmyTmh1xYgmP9fdpWthvvc2XFVvJJiCLvy/1mABDwW+tW4EHAvQHOwdIYliNSGl+NxouRuFhW2G3HPD5haTGf1S72qyIaeceCh6AQr2vZVL9uo3MZmun0dIepmY21CfCwO02NiD/wPdFqHrYDclZFdgA2vUdFMLcRLspqCOtzeGoRuGC4C6w2yiQeYJlf6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMMnqnoRnrZJip01ApUd7Cifh9QkB3xina2UAt3c3yQ=;
 b=JhL+4R7h98uuYkJdaQ8bvf0viwHCgd2vgGBCnxsPy0BEaB7oPyW7kLLzD2kdgKLRnQFjRF+cK/R+zdzZr9tNrHae7SIY6rFR31CTGDpFqQwws1LlArYeJpwd42fPV4Cfl0H6dl5XCqGfSL3iRy3+yMLYrwUlth2L4WyZ5Mb3kJdGo546eiPWobrjMGal2Fn84qYSkkutT+lwLK8fI5Y9O4I/dfXVDl2WkCMR8QWhQNw2AW78Es/ryS5aorCzIB45oVnoPJStP8CrwQHKFA8rHiwR7n+zxZoAH77/OyfBiWdsqKS1nyQ5rR0dHc9CKVQpG/szHZ6SuaeDUaOaqQt/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMMnqnoRnrZJip01ApUd7Cifh9QkB3xina2UAt3c3yQ=;
 b=YdTEgM7CtePe9fr/HTAlaNuPdYC2pzCUdCoPuWJ2CkB8Wev74jalt8AU6JkyTqQlTw6BrYVr2tVh3sbW5NfK9D5RqczhSXw32hClJ89/0IKgb/scssMdR1XoTRlHBe4y60VTnPUEM/m4ki5bsebIeZQUTlBs8Y9GgihzfzOY1jE=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 16:37:10 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346%7]) with mapi id 15.20.4457.020; Mon, 30 Aug 2021
 16:37:10 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "989440@bugs.debian.org" <989440@bugs.debian.org>
CC: Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: Debian: gmp: add support for arc
Thread-Topic: Re: Debian: gmp: add support for arc
Thread-Index: AdecPpnk7AIhWGCUS5aYUCAgDtDZrA==
Date: Mon, 30 Aug 2021 16:37:09 +0000
Message-ID: <PH0PR12MB540177A1FA40344FEE3DCADCA1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1mZTcxYTBmNy0wODMxLTExZWMtYmYxYi1mYzQ0?=
 =?us-ascii?Q?ODIzY2FiYmNcYW1lLXRlc3RcZmU3MWEwZjktMDgzMS0xMWVjLWJmMWItZmM0?=
 =?us-ascii?Q?NDgyM2NhYmJjYm9keS50eHQiIHN6PSIzMjIiIHQ9IjEzMjc0NjUwNzM2NzA3?=
 =?us-ascii?Q?ODM5NyIgaD0iQjlDQ0drazdpamtieTR2aDZSSDI0OXdTcjlBPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFE?=
 =?us-ascii?Q?OTJjbkFQcHpYQWZxNkwwbHMyb29oK3JvdlNXemFpaUVOQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQUdDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUE3NUFtc2dBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QnRB?=
 =?us-ascii?Q?R2tBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUhRQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFIUUFjd0J0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZFFC?=
 =?us-ascii?Q?dEFHTUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR2NBZEFCekFGOEFjQUJ5QUc4?=
 =?us-ascii?Q?QVpBQjFBR01BZEFCZkFIUUFjZ0JoQUdrQWJnQnBBRzRBWndBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QmhBR3dBWlFCekFGOEFZUUJqQUdNQWJ3QjFBRzRB?=
 =?us-ascii?Q?ZEFCZkFIQUFiQUJoQUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCeEFIVUFid0IwQUdVQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFiZ0J3QUhNQVh3QnNB?=
 =?us-ascii?Q?R2tBWXdCbEFHNEFjd0JsQUY4QWRBQmxBSElBYlFCZkFERUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBY3dCMEFIVUFaQUJsQUc0QWRBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QjJBR2NBWHdCckFHVUFlUUIzQUc4QWNnQmtBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUEiLz48L21ldGE+?=
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5c9fad5-d8e7-4325-57ca-08d96bd469bd
x-ms-traffictypediagnostic: PH0PR12MB5450:
x-microsoft-antispam-prvs: <PH0PR12MB54504306666F3FBF980E172DA1CB9@PH0PR12MB5450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aHWrEqJcKsZBU7OdQdLs+UyJTXg4o1kxpqinPPF+wn4d0gfVnHp3+KqzlFobIy2T0p30PzMG/+EeGpPsXnm6X6cfU9zpujhUb/3g2r1zkXvWCiCPlrG8cKXaxRI8altS+vizpJJthtjzh3M9HBoN9V8hajT1EOdOTyZRG48fFwSEYsaiWDSQ5ycvp+HayNzCpKlJ7OA5cPNqFSj0cPm0Mhn5Eg4wo/P7KuAtNrP1Typ/iAlJ12Pb4A0Ga3QVafJaQwluQ/DQHnpthST4xV5/M2BASFnovbJ6OPpWYk7Qsdv7rstHuU9x813P0FjOQAg4K5aEOcLaiYsbWvkuHOuvGukNNB2Nf37xKW92ZTsPOjtZc0pUEg3wm3DsHdMR109OXQTEunWunMhP2sDC/iycc/3L4oI6v4bS7dMWrhcP1vy5Gn0VLjfw+j47DjkMh7ezJ++S48oLIoe9wa8UJqK8QC9QD79WtW2Rtb3brshBP/FEwGKNKiSwPIUumxVmu9LjtZU0daMCwUqmVYfgnsfAf6US4ChmP5ZoxthEeYDlRnxWDgvGkfZOmj0gU8pbs1V5UOcNjZp21ObT+W1wXuiWgDajkcsf5YEF7O5Lm5peSiZEcapow81We5RljjzJ3rxsfk2J1xl9fdD2FX1Ku4abjNQqSTOgJen619gfBB2INabN1VScggUwJ0LEARFftfIv83LNObutmvI9DFPTeJUR7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(55016002)(478600001)(76116006)(64756008)(66476007)(122000001)(66446008)(52536014)(38100700002)(316002)(66556008)(83380400001)(71200400001)(8936002)(66946007)(6916009)(2906002)(9686003)(6506007)(86362001)(5660300002)(33656002)(186003)(7696005)(38070700005)(8676002)(558084003)(4326008)(26005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hb+dm9TEKRGjdHRm5lYNSptHHnOJOsbpRLXhMm02CfHOvjULs0x9DLo/YS/B?=
 =?us-ascii?Q?PTOHQMdr7io/l5JtY9OAGKzCKY6xlG2l04TWXqwmEKZsx7ngQbxlqqkch5QO?=
 =?us-ascii?Q?fAW4vde8vXFF7drKD9b1/IiLDMpTWtob178deU4VGmHpVCjOKIWLd/3og1hU?=
 =?us-ascii?Q?oM/0V2OgdMfLN+iu7+zVXBc4ZNv4Ols5yWblE9vD51Y5ftyijfZm0Fm9fIV3?=
 =?us-ascii?Q?0cu7UuSKjUmJkie9wOF7N82wBsxcT/jQeO/ercaxZ6KuWQCHw8+WtsqS4/dE?=
 =?us-ascii?Q?3030ADZeoy4/wUQWjk1rbAP9tJN5N6RBJ+kGImptWL89EqrpDAPYM3+79hTj?=
 =?us-ascii?Q?d3Iz1LZKdNOt2BmLmXofkQcuUMtYAmXYlkm+QaMqqHG2BoyJ8M+IJab5K6c3?=
 =?us-ascii?Q?lOtU20uqiQVcWE70U5Awg85QZXrZ2aTKXlh/ZmqM05LxkGxp2Y/titEf71mI?=
 =?us-ascii?Q?v1exnzW+nZS6V/qIpk4CdCgLbiQYjJ1DFSV+sXSeI7GW/h3lao65PwE7zoL5?=
 =?us-ascii?Q?wgwLSbwlYq2JliYJDxMMOD2PjT7nAqTpvNDkHPeQ7iNHvER+piPYXopjoKQ6?=
 =?us-ascii?Q?qP2rYLTMnPkpdw9rHS9w7sCsfF6RCVTNLCQ8hEt2MD3Anl1pwbEbKR7fbR8Q?=
 =?us-ascii?Q?TysG0HRJuGn87OBUCFcDD2RBUpQKRBgWCk2llY/8BVCMOmFKfeMbEsG/IY1L?=
 =?us-ascii?Q?CdfQshmXHiU2RswF3F8uENl559Vfgdrw2eBWt1C9177EIblypW9HxG6VuO9d?=
 =?us-ascii?Q?/oww7YVb4aMF7anOUy+1xH6OoKnUYxKAffYPWg3sKjXHIik7yCVSnV6CFX9D?=
 =?us-ascii?Q?uRKpYeQvelDcNs3lCimXbCNzmpTKK9MY1mM4HE0UPjEW5AdxbpXkRX/Z8Dei?=
 =?us-ascii?Q?iAArO8MqLJvQzp03zebwK2Dfg1Qel4+WOkNV+LCZar+XBqJpi+7BNB0KhvuO?=
 =?us-ascii?Q?6KA4N1pBiN/J24bRVuCUvBdpmghSJFSQgs/a5a3cJGqGu6QLMCIqRStO1gMb?=
 =?us-ascii?Q?0eN7q5+IApC9Psosyxr66bw3eZ30jHHgnhxbz6CdUAybSelA2AEQxxEuuroS?=
 =?us-ascii?Q?xaePI+gLRoJ4lx9m/9KyqiE6bZY4Mo1vRBOaUpncYsremLtQ8gXBO/izzb29?=
 =?us-ascii?Q?g4IhyniIoIMYhiywGkuX/D97/ezid3JGcu4kWTxdqoU8KopGVMMlb9tD9aco?=
 =?us-ascii?Q?TMX3lLU0DfkojxCnkrfKZcYvTWWrCHJmdCFuDrjIYi76qMkJstuZjmpN5WkM?=
 =?us-ascii?Q?3j2pSXjqYaKP3v9evvOmeFTHXyeJzJ7HrLTFpvd0IrqdwSwTwpvFGUFgRofI?=
 =?us-ascii?Q?gwQ=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c9fad5-d8e7-4325-57ca-08d96bd469bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 16:37:09.9397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3t2eRC5BoQEr5CB8yEMREJNuAZwRgskYH49F4esLdD/COOrUn+U0pwS5muk3WCMWO17rWMHFjHh5Ju5uTYViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_093719_674599_FB4F0794 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 30 Aug 2021 10:00:21 -0700
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

On Thu, 3 Jun 2021 19:00:30 +0000 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote: 
> Source: gmp 
> Severity: normal 
> Tags: patch 
> 
> Hi, 
> 
> To bootstrap arc port we need symbols file update in gmp. 
> Patch attached. 

Ping!

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
