Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09948C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 05:18:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8D7206EB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 05:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W1Pp42sF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Zj1QnE2/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l+jwic6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8D7206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fWt8PDtwgZM59wG5oivOKvti+DPFdI4h+WU3jrc2jrs=; b=W1Pp42sFSiX/hM
	kzCd+UeesS2jQ3+uG5dVxjtdtrKazRZQDgpUk99b6Z7f+ebx5VkMZTkYFplMUGDnwsDVV2DzLlSER
	6XObmKUCSn4T7c3rV+CCAskYMUz/CqT+v5+KMU17KaGA7CPwdrvChO9TCYk7bdUGHpTxArxXHJI1H
	KHK3GX3s4cHLXvJh5Okr1aYapATpz1ANE7Nnk8natJRu9kpRJnnH/qGZF+4VPTLDAXIH441iAw36W
	sjalFz11qpk5iaMaSkyKXFNwOQjytx4Nh2JGDXwv+QMJmQeVCEqIyDfVQHj7JFbExK8trfd/JymMu
	x/qFlqPI2vODebZe4oPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCGEr-0002oC-Nc; Thu, 12 Mar 2020 05:18:33 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCGEp-0002no-9V
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 05:18:32 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C63D8C0F7C;
 Thu, 12 Mar 2020 05:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583990310; bh=2doHlEWJCyc+xg49wpEPk9OGALH5Ectb4d+QzX0R964=;
 h=From:To:CC:Subject:Date:From;
 b=Zj1QnE2/cEtaQy2QXJYHHrdqDOEVEy1DSexHhgDlQXaN0ZaNmuybhB7yhN4JLLDT3
 URxyqPovg+MtUFvmyn0qG1eL6Q86FIyF77jSpMQi88Yj+svV3949gzZmxAnLJxEsIg
 WAqerRCdkElxyepdy5Vb6JMasL2X6sbY1pL0KYGJ79AW6VTWP04Z6G+Eft1kJFz5mQ
 hsaN6McLUiZMivS2jgmsWv/SrCZzTffEfyecSH4ofDzGVpOshD6guoG8slBPkMBOKB
 mC7l48h56urNeVtuYw7VoK9ZuFWGEYB8dOp7Dwau+HRWvE0QXmgIAmBrGxtjaSeLXB
 dyHlXfGB+4KIw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8B2AAA00B2;
 Thu, 12 Mar 2020 05:18:30 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 22:18:10 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 22:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTemJde9/Of0pg7Ly3hP1f9+ahq5sExuPc2Xf/eK8qA/ymPW4sGi2CZd0WdlOSk2kOeIjNY1b5UJwPIisIHuPzX5PdfgJeBsvL64PIJWWrseP2RrkujrX0fSavryX/Rh+4STTxzBeHz1hp8U949vzINCaFPZHKF9QzH8/I1X6t7IljzY3bN3s8i2gpvD94W28RU6SscG74FxQbuWbp2INhfS2/RZJjBAU6si+J9ynJHIe4BeGXoaK1BKrcRb11Y9adC+bPIbZnTS+/o7Rmds+Xaja7Uw9RO9cb8lwnMsk1A9roh4jqgAuKuDGE1v6dXGr6s2E4YtIV6rjYF8I0Dumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEep6VEdsa+AhjDhZLK5Z9Uqof7wT0AUqXybO3fCiVo=;
 b=JADt54xEsCifRSDLKvlLJwh5UD/eqblJZfXtKkxcoU9k8dsh77C+e2moAnFO7rXo/F5UmdRkXuWd2fRykVqKXL0Na/ZPKN/G4C8/RzlqkS0RKWnr1P31PdqDhf6jcLzPW2LxB7ZravjOQYUvdIR08F7+5glhlIDZjKryLaQZLCmhLcTlRMq/jqGU5cSyFIvr8aIJ3MSjMmZpYG1xKj5PmveIY+uy9W2Dy9FNf6TuKYfeUVRBEmzZxsj5mfrkQGac1EJknr350BIL6dKEvRzLEoRVJlPn+loa+jqTyl4Z5MD2Pxcng2FjirWeqg2ujyNk68K18EpQbsEAS7F1d32vDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEep6VEdsa+AhjDhZLK5Z9Uqof7wT0AUqXybO3fCiVo=;
 b=l+jwic6Z0+3Kqnw2DEWGfcCLcAugBhya3IEth5WgMlNMaWm5I/lnWOgEQWV+W0Pn29gCqX2bhHbyU+n9kAKL7kzPoeFPjLgC7BxikDR7sKX/nSfknm3tw84t6MsbXvS37/IE87+atClPw7+pMbgXx70pIs5pDCS3qQLXKY63ibY=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 (2603:10b6:910:1c::14) by CY4PR1201MB0118.namprd12.prod.outlook.com
 (2603:10b6:910:20::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 05:18:07 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44%12]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 05:18:07 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [GIT PULL] drm/arc: Filter out interlaced mode
Thread-Topic: [GIT PULL] drm/arc: Filter out interlaced mode
Thread-Index: AdX4LPS9gSZ9WCfVSgWTFco+YGMc5w==
Date: Thu, 12 Mar 2020 05:18:07 +0000
Message-ID: <CY4PR1201MB01206BA6BD0015BE48A5CE3DA1FD0@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1kOWNhOWFiNC02NDIwLTExZWEtODAzMi04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcZDljYTlhYjUtNjQyMC0xMWVhLTgwMzItODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSIxMTA5IiB0PSIxMzIyODQ2Mzg4NTU5?=
 =?us-ascii?Q?NzgzNzIiIGg9IkNqVFBxNFJ3WkhzcHRXcVZPenNPNWVFVGx3ND0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?Q0VYVUNjTGZqVkFlMDZoZHZtZzFaUTdUcUYyK2FEVmxBT0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBTW9OL3h3QUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
 =?us-ascii?Q?Z0JoQUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFI?=
 =?us-ascii?Q?UUFaUUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0Jo?=
 =?us-ascii?Q?QUcwQWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFi?=
 =?us-ascii?Q?Z0JsQUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1B?=
 =?us-ascii?Q?RzhBZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRB?=
 =?us-ascii?Q?QnpBRzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFI?=
 =?us-ascii?Q?a0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4?=
 =?us-ascii?Q?QWRBQnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHRUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VB?=
 =?us-ascii?Q?YmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0Jm?=
 =?us-ascii?Q?QUhFQWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpB?=
 =?us-ascii?Q?R1VBWHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJ6QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFH?=
 =?us-ascii?Q?MEFYd0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpR?=
 =?us-ascii?Q?QjVBSGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQT0iLz48L21ldGE+?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [183.89.24.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 979838a1-3303-442a-1bcd-08d7c644c009
x-ms-traffictypediagnostic: CY4PR1201MB0118:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0118562E1BF8B7752A3A0CA8A1FD0@CY4PR1201MB0118.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(376002)(396003)(366004)(346002)(199004)(66446008)(66476007)(64756008)(66556008)(8676002)(81156014)(8936002)(71200400001)(5660300002)(54906003)(478600001)(110136005)(86362001)(4744005)(316002)(52536014)(9686003)(26005)(55016002)(81166006)(2906002)(33656002)(6506007)(186003)(66946007)(7696005)(76116006)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0118;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uMIftp4zJBbYlbmUg3+9HSeb4C8SifjoFVVRPfUHRDR0TRFV0FntxV5R8hAwv9DU2eurXn86DzHhGdjpIwkzUJ7iJ1gA0hgV6rge+Vl7syJB/2sbdlSwTHn4UKYX75aNp20nclx9JzSdxa6h1frW8I4CpI81UyINJAdpm+3kddwvQnDzY+7yomSbRs+ea7U/ujmj01A71Uq0FarNy1vFRIs/tF72rSRhvsexLQqi9CvW9KqJNExEdYjZDdQf164EKYHd59FLhtc9E1IPVPPMrVvp6nb5e+/Krg0PSiO58w3/qUVBB7NbixdLQsvtghG90MwXPk8bQYxq6jYuvI8evEIfOj+DTHmJ8OFcx8Y/4tLmoeh58ZXRCKFVfRlcfcQRRWsUwKPlfvyar51mxXGvsD/Ky1NZigVlLoRC3ubgxfVkHol0qOmg71Tt017YyrfE
x-ms-exchange-antispam-messagedata: PaBNhREfLMOdG4vDGwr8GyfTjuj4QKcqCZzTeGCVr0ii9YFEpHshzWbQh3Lo1Tw5dxoYiBg0QJfcwfoQeZE9Q7xIlMWMkGrc3FM52ZfIDisftw7g8dYC6ATPiXicM9puljpygi+feaR6Um930i9l1g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 979838a1-3303-442a-1bcd-08d7c644c009
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 05:18:07.6813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eUTXg/UGN8QR+wQ9N4/lJrwuNAkn0rw3UeEMAx85PjaiEyCz8VsyubsjYiVHRsGVZ4JiQ68m6jQM+yfPZv4Gnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0118
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_221831_406657_08343F5C 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi David, Daniel!

The following changes since commit e3c3b6e66da1caeb39a504b03ddcdd3693e45254:

  Merge tag 'exynos-drm-fixes-for-v5.6-rc5-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-fixes (2020-03-12 11:02:52 +1000)

are available in the Git repository at:

  git@github.com:abrodkin/linux.git tags/arcpgu-updates-2020.03.12

for you to fetch changes up to 1e8928584e8f29c31c8db1a50b5bdb1769047434:

  DRM: ARC: PGU: interlaced mode not supported (2020-03-12 07:59:06 +0300)

----------------------------------------------------------------
There's just one tiny fix this time around with explicit filtering
of interlaced modes as they are not supported by ARC PGU hardware.

----------------------------------------------------------------
Eugeniy Paltsev (1):
      DRM: ARC: PGU: interlaced mode not supported

 drivers/gpu/drm/arc/arcpgu_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

Note this is based on the current drm/drm-fixes contents.

Thanks,
Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
