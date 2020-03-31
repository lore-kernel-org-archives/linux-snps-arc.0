Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3372BC43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 16:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E263920784
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 16:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDmCixhS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BDw8aRDZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Qy+gFq9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E263920784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwfJcP+2QKQKmHe2z5TdR1cJuqSFW8vSGkCX+nUjtrg=; b=JDmCixhS0n/87V
	ghz6w8Ctjaf0ctQ0ztymS+uDweK+YxbIpAsEYd/YD4bBO+e1rXZXXAy5sb0sWWWesM7hcPmbssHBT
	pPLLAh7rLanwxHVcoyNG/7stXwEZF/URDXKr18Y/E8o9O6rln09X2kbBbMaAepH9d4HpWnvwOdwZ7
	4ETrs0e+Ct2EuNdbZwc3CjpQPsdedwFhQuDjXQJkV30nj9M7CwX+gnFwAbaqap34mLXzw3W9o0MHn
	wwmRsxtygSa4lBwzKEc3/4bYCdSCfVC88weXIF0uATU4pxunVfh0zc8aI1YsadiGl+iH0vf0P5IeN
	QbyFpZtnOsyoljVjFERA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJk4-0007rE-Qq; Tue, 31 Mar 2020 16:27:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJj8-0006zT-Gp
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 16:27:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9C38CC0F72;
 Tue, 31 Mar 2020 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585672016; bh=RjWyLQkc00C77sN4GS/pWGvcdYIgZCeQdlOIIDqq4+I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BDw8aRDZ1RPUSixLK/jGMirIV+QmRjiY1VILRZ3tGZFZO2ol/sFUD8zXoLzqYbP6I
 sHRuE6V8RlxiejkgR7bw6FdIkD2xy90NhSdiltk07+O4zhMoS5vps3Krjn1KB1OuRi
 zlAP3JCPSiiAoeWEPWcNUpNYRO81Xgq0pfW7Zi/YF+4EaLFt5EJnqFRD7wlIG+yeUV
 N/v59eV74xYJTS0sgt0hLqb3ZN1nZ6Mbe8QMvr2V3SdhHLcWTCXRQRzX0xS22gUIkl
 8fBJKu79csVFrRjWlDsAfVrcz5jT4R9s1w9U9lE+8YbQe8DjSIb6imFOzD7KK+MhFN
 TYiyXfqjhNGAA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C6C6EA007F;
 Tue, 31 Mar 2020 16:26:55 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 09:26:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 09:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcaMt8en/3vCP0WpnXYR9Jquz9NcLrl8+0DLwFx11e4bPvI1Ulgpr7cKvO0xRzswAFOl0RrQtujPrRh+rKYXbFAeBym+k2Onb1Cj7ENzJWEYu8MBjJTD+xgNiL3XLJhbLxp8fFLMbSEjEw+4Tzs5ePehJ/YQZF5vu1oXC5m/kiaz8mzJmtiRJV58uMzneEoWVNIfLrDM0u+cWlgzHKc88IaLUSex5A09YH6rp+xYO4yM2mR/8DF5kSubgMnWOdBlXB0RpDdh2JlVOKcutIqRB8gMLpg/kQ3R6Kd3wNdNfXC3Yu0fqfNUVLOyFNj9lFJO3LRbr/m1a0yjYMyeYvBqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjWyLQkc00C77sN4GS/pWGvcdYIgZCeQdlOIIDqq4+I=;
 b=GlBsy0RGErt2XwZzSdQHFXLjeAbYPeLtGD1wYrEsiaGWKNRjZ25BjQHdZbtIP4x6vROn5yrSB3WqVvm0i8jlY7x+7JTPeVqvB3Hn1h/cZTC4tzFvmWrs+Jorl+PmVrc8JnbCpp9txsOp1LU1QsmI3DFQk84neIvYT9P0o2ve22j/zxvDSP5pIb488d97+fxLFDMhB2sfcutatjRC1K4zjzAQSTUtQWWY7OBJQhQKIaIaRDPHGu1gN7y+i6ajNvncQyWdppKIKD88bJ7Zy08zCrwCSLjOdfKXXzOp+JgUFtqfPHk1oLGPnPdcrbZY04708Nbj1Umg0kWIkfiB1aQCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjWyLQkc00C77sN4GS/pWGvcdYIgZCeQdlOIIDqq4+I=;
 b=Qy+gFq9+6CPwjRxgRDE1akhZwflmlCiQKTs1o/qJ5KhzYlY8MNMbLDkPHU1sCYruEFyYF6RfEhXO/aBvLkz08nzeF6exT0oS0pZaksV6vLvWyXncLUsHQ6lOArdJFVNmVoS1czomouuv9ztTKqOQMOPar7PKQqgN+CKKOmT4UPw=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0087.namprd12.prod.outlook.com (10.172.77.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 16:26:33 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44%12]) with mapi id 15.20.2856.019; Tue, 31 Mar
 2020 16:26:33 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Subject: RE: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Topic: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
Thread-Index: AQHWBV3WXZZeHXAyNUiCf5cx1VuaZqhifWKAgABp7IA=
Date: Tue, 31 Mar 2020 16:26:33 +0000
Message-ID: <CY4PR1201MB012004563CBA85075C153D99A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20200329000503.27897-1-vgupta@synopsys.com>
 <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
In-Reply-To: <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy02MGMwMjRkYS03MzZjLTExZWEtODAzOC04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcNjBjMDI0ZGMtNzM2Yy0xMWVhLTgwMzgtODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSI2NDEiIHQ9IjEzMjMwMTQ1NTkxNTE5?=
 =?us-ascii?Q?NTYwOCIgaD0iV3BvN0Rjc3ptYUxrRWU3K2J0dE0xRnQ5K3c0PSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFE?=
 =?us-ascii?Q?WW5CY2plUWZXQVI1cCt0dWFPcG1qSG1uNjI1bzZtYU1PQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFNakxzMmdBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
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
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QmhB?=
 =?us-ascii?Q?RzBBY3dCMUFHNEFad0JmQUhJQVpRQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUcwQWFRQmpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFITUFkQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZEFC?=
 =?us-ascii?Q?ekFHMEFZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhr?=
 =?us-ascii?Q?QVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QjFBRzBBWXdBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQVp3QjBBSE1BWHdCd0FISUFid0JrQUhVQVl3QjBBRjhB?=
 =?us-ascii?Q?ZEFCeUFHRUFhUUJ1QUdrQWJnQm5BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCaEFHTUFZd0J2QUhVQWJnQjBBRjhBY0FCc0FHRUFi?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFZUUJzQUdVQWN3QmZB?=
 =?us-ascii?Q?SEVBZFFCdkFIUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBTVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QnpBRzRBY0FCekFGOEFiQUJwQUdNQVpRQnVBSE1BWlFCZkFIUUFaUUJ5QUcw?=
 =?us-ascii?Q?QVh3QnpBSFFBZFFCa0FHVUFiZ0IwQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhZQVp3QmZBR3NBWlFC?=
 =?us-ascii?Q?NUFIY0Fid0J5QUdRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7edf2954-3d37-429e-434f-08d7d59046a2
x-ms-traffictypediagnostic: CY4PR1201MB0087:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0087A890574154F8373F51F1A1C80@CY4PR1201MB0087.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0120.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(33656002)(71200400001)(8676002)(4744005)(55016002)(9686003)(53546011)(107886003)(7696005)(4326008)(6506007)(81156014)(81166006)(8936002)(6916009)(52536014)(2906002)(5660300002)(86362001)(54906003)(66476007)(186003)(26005)(66556008)(66446008)(64756008)(498600001)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V7mkVK+Sxa9oSwLobQXTBS0ZYjKJ54umRKgtKOqgNoCL9T5NjdIh4B//kaNgk8dxuRE5II7pDI6fLAwo4Oci2JQ6Ua8ODpnYN9A/HJxwBnBl8/azhsS2bWpQhi6XG1P4wxzSG9Y0H6ti+zCQz1Q98XwxZ3NLa/WcdRGCOEohRxpD63PtBzgLqxtd/DE0w8EAKtN3HS9yD9kDZDoJuWbwoMd8+q1D3BwhYzW1KuQYDiRmCIyHX2BLwkEYh2MwLNa7OoNPimWLqf2VLxoRWUMo3S6u+9piNeUpfHgzfsll2U2ykRITWTHfGiWD3qu5RvuREBx8jc2mCloJ7jxNVfDjr/ck+aL2/vNKnR7GUK98l3+O0en18ghKwXe3gJMxtDjdaMzGWBkM0aUZbxY1jh2/UXZ1ZHVLZcudKQzkkkgXFDEGtJIY23NvPbB5TOWLZxFN
x-ms-exchange-antispam-messagedata: uPafpRk/cQftY09qUHYStLF6W5x71881I7xS+ww80uEz4Ww/qS8MgNfC2h7+lcfcsH4FiSDoY90fU16/jxa5asjYuxmuOa1ZidWt2TzxUTT95S4dEhf1gA+6jnX2nwk5JNDEhCN/9OlDyloWxtHaMg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edf2954-3d37-429e-434f-08d7d59046a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 16:26:33.2101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDWO7NfrKnMrvF2BgJenmeWMNVSyX1IYapKl/EGaUgDBXNI3TTqQU7Dq/dE5rOXLFOvCPSm8DA8F900KBk3YEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0087
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_092658_889549_D8D3FA49 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Claus,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Behalf Of Claudiu Zissulescu
> Ianculescu
> Sent: Tuesday, March 31, 2020 1:07 PM
> To: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org; gcc-patches@gcc.gnu.org; Claudiu Zissulescu
> <claziss@synopsys.com>
> Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
> 
> Pushed.

Is this one eligible for being back-ported to older GCCs?
At least GCC 9.x would be really good.

-Alexey
 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
