Return-Path: <SRS0=6bto=2A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2170C43603
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2019 09:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BFCA206E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2019 09:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mr2OnKks";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F1CcbQ/i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="LsjeeoD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BFCA206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeftOcFIGpJhd/QnTxDDavh7TYMD5vjdqxQKMHztWAo=; b=Mr2OnKks8+4t8y
	G6GyFZyhGBWEXtLQO0ClRJjLuVCxIHol6VaoSV+D/+od40rUUXzi0nUf5pJ6DqUtNUdqkQhenF4gf
	PEVB5qtnz7XUwb198wsDGTspTeIoBcn8IoKEpcoIKKzw6KzBWMztyFDbK/v85dTDYzdST4eCM5OGy
	YyO8BgDMHpvD8Ev77Iu3WEdqlX5e0Xd+ssiIWLUY5LoYW4QXJ+WzcNP53re2058cYUAgEAp9r3XaQ
	sMajNVR2JsnbTqIuGvq+tpGWi37KvkPixk0LdExL8hplbXN46+6iea8K2iBKWL7qecGcb6Na/mc5Q
	0iyN6Qhdv0glpwGKJk6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iebZU-0005Hp-Db; Tue, 10 Dec 2019 09:12:44 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iebZR-0005H3-8l
 for linux-snps-arc@lists.infradead.org; Tue, 10 Dec 2019 09:12:43 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 14F76C008B;
 Tue, 10 Dec 2019 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575969158; bh=bIzxUcrBOmOkBxsxbzd2XNjdpCR95pGCvLUBkG0OcJ8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=F1CcbQ/iXkDpqnIZqWAAXIWrbcXn/66oiMx4YYetjHyvZs2uNExGcm6Mg2h1vfcVn
 nY1hi/sEcQe6+P9u0/UEIJRHw4n0bpU2Xq5kbztAnldflgk8FGZZaZ7qn9DOAkrWqf
 az8m+vEKn6s71rGJfugFfe12DvJzGWyNES8eS1VsavbjVb8UcYR7A7RCn2aor52Ok+
 GMdE5BK4PbcrvLogfLKOHUX3YCcSrpbNZ46BFK76CsBynSHPhh+JgMl6nblG1ZFAH5
 P7W2apSZfrzu1cLbnfSsm5IzXLqCJBnRhxZ7EzqPXy60M+sCgwSUBXeoJlpGya46Zc
 hViBWjkg2NADA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1C1D1A007E;
 Tue, 10 Dec 2019 09:12:36 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Dec 2019 01:12:36 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Dec 2019 01:12:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aov89/oD7rKmTeGR1zU67I+5OSexHymM56u61WbdouS0EBtVzGIA/JJMpTQMyM22KJse0W9briFcLAUqgegZwqGNe8giu7K41dLoDqOZ1ISKfoTxzg8ScdH4p2cYBHe9tIC/Cp/p1ZCGpCxnOJdJs/Ks1ocX2JY87/2rL7SMZdhfBAyUEFwmO5E6juMfk5t/wWVx7/b5Wcsa6kNfJ9e/OBvImyPZTSPx4OhVlnNrnWfqeM1jVCiAbDHPH4XcgPhVXRU1c1woGwUW9R29h7fjYd7GfNW8yuQv8Z2XUd0wYqq2QQMRqJFUQcTJX4Bhn1w313cMuzPhtGtyYwGgdUHuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWI4qQAVZU9pIVYA3HmNASRP6eSsF81+bQus5fx3qpw=;
 b=PZVzzsinylkt351VlxEziRiRN8xedB63FP6LEnz2PQOBJ9xQ5kJWF1u3faORZEH5zFZpjOFgHc/gi7UsM4gb00o/fdziTRhALsSxxEy9rzo2XeZVsn7cIviHUNHtSvUS4/vXZvUqz/jk1XeSlzh/GwUkJfEBYnfrJ7a8TjhG7CdmTxGZtM+AVAjI6b0w21T9rW0VBNz/9trtrXmSQIDsXJVQemHXVxIPotPIreNaq75b4NM1GvQb7n9ReIPqyBBBQ2Ej0DxiCoainQfuf24CGKxDa+q4/2JChjfVMKIGdAztNfA5QSpnxHVHNpnoRJ7LgF5dok+rLej0tREK8MTIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWI4qQAVZU9pIVYA3HmNASRP6eSsF81+bQus5fx3qpw=;
 b=LsjeeoD+5EZDl013R20FUpzkXrEma19zLfgYExo/Dbu/EGp5M8QQJKvsVBERpSMcxb1M7aCicS3js0wBx9c+RJurTVutvNK8rVlrRU6dav2/Ls9OgQv+MjUg3bxV3lI+4+9UI5vCMEz2jBvvL9S/qjWlDn6I3Ubo7j2ndDfEOHc=
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB3189.namprd12.prod.outlook.com (20.179.92.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 10 Dec 2019 09:12:34 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::ed87:95bf:7c40:3fa5]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::ed87:95bf:7c40:3fa5%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 09:12:34 +0000
From: Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>
Subject: RE: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Topic: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Index: AQHVrsNYos8/uOEr50yuTGw0RcKuy6ezFe4g
Date: Tue, 10 Dec 2019 09:12:34 +0000
Message-ID: <BYAPR12MB301302F82982712931B60172CA5B0@BYAPR12MB3013.namprd12.prod.outlook.com>
References: <20191209190218.20544-1-vgupta@synopsys.com>
In-Reply-To: <20191209190218.20544-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2xhemlzc1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTMxNzAzMGE2LTFiMmQtMTFlYS05MzFmLTk0NjU5?=
 =?us-ascii?Q?Y2ZlNGQ3MVxhbWUtdGVzdFwzMTcwMzBhOC0xYjJkLTExZWEtOTMxZi05NDY1?=
 =?us-ascii?Q?OWNmZTRkNzFib2R5LnR4dCIgc3o9IjY1NzIiIHQ9IjEzMjIwNDQyNzUxNTMz?=
 =?us-ascii?Q?NjI2MiIgaD0iVmVFUTVsVm03ZWl1RlBXUVNGeGtwMHhEalJNPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFC?=
 =?us-ascii?Q?R0ZzbnpPYS9WQWV1c09kY2svYzZGNjZ3NTF5VDl6b1VPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUF4YzdySEFBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
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
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=claziss@synopsys.com; 
x-originating-ip: [188.25.117.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b08f8c56-2b23-40db-72e4-08d77d511824
x-ms-traffictypediagnostic: BYAPR12MB3189:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3189918D09696EFF31D08B13CA5B0@BYAPR12MB3189.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(39860400002)(376002)(189003)(199004)(13464003)(6506007)(53546011)(8936002)(64756008)(33656002)(7696005)(66446008)(5660300002)(478600001)(2906002)(8676002)(316002)(81166006)(81156014)(186003)(4326008)(107886003)(26005)(55016002)(9686003)(71190400001)(52536014)(66556008)(76116006)(229853002)(66946007)(66476007)(86362001)(71200400001)(110136005)(54906003)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3189;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J9UNZ2lkykEvqMoKxlQKsyrh3d9wZ4NZ+sl52GIoSLeRAtxS9/i23F+xuNNp3b59kUc5Va9FG+yi7d5BDWUj3g9aggUoe2A2Jld5+grzkWkb0LMHdruPcGBPDLzrNnJGSEE2lmKaZUSQMs2nYEgXJxT2Xr7rdvEa9f8LN4Npm7eyAGG4TOI65asNUR2HAe2cAoU66oqMENdTXt0IQcENDvCrWcRK0pKXkqXd1fS2jQqag6p/4nOXSIMuSfqCuY04sb6jCdG95hh199tDRwr9aMwTZMh50djO7NlBi6/2HEEEpz5JJ18HCO92j/ex9zYh1wAxKlt4CuOroADGKJuao1yMVyETx+VRqjeWIcj7FqLpg1KRO9TvfkrRkiO5zKY1gquKSs2Sn3JLX433AhlItXfLfRhOLaYabPiSpxkXVmbzy6tGwUhu92ez4BGhfF72xRAU+6XmIsdOt2msyblypYrZ5tSUvkzt293fOQZvfczt6nJJPJu0oVKQS5bC80Ut
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b08f8c56-2b23-40db-72e4-08d77d511824
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 09:12:34.4520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25rMSceiqavN4bC7hBNIDo8gNXH2DeVSDvUYviDP39ud3sI+UGxxk76jZ86feJcDnKjMLQP25CuO017+tUO3dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3189
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_011241_436637_4712694C 
X-CRM114-Status: GOOD (  14.80  )
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
 "andrew.burgess@embecosm.com" <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

Thank you for your contribution, I'll push it asap. As far as I understand, you need this patch both in gcc9 branch and mainline.

Cheers,
Claudiu

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta@synopsys.com]
> Sent: Monday, December 09, 2019 8:02 PM
> To: gcc-patches@gcc.gnu.org
> Cc: Claudiu Zissulescu <claziss@synopsys.com>;
> andrew.burgess@embecosm.com; linux-snps-arc@lists.infradead.org;
> Vineet Gupta <vgupta@synopsys.com>
> Subject: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
> comparisons
> 
> ARC gcc generates FDCMP instructions which raises Invalid operation for
> signaling NaN only. This causes glibc iseqsig() primitives to fail (in
> the current ongoing glibc port to ARC)
> 
> So split up the hard float compares into two categories and for unordered
> compares generate the FDCMPF instruction (vs. FDCMP) which raises
> exception
> for either NaNs.
> 
> With this fix testsuite/gcc.dg/torture/pr52451.c passes for ARC.
> 
> Also passes 6 additional tests in glibc testsuite (test*iseqsig) and no
> regressions
> 
> gcc/
> xxxx-xx-xx  Vineet Gupta  <vgupta@synopsys.com>
> 
> 	* config/arc/arc-modes.def (CC_FPUE): New Mode CC_FPUE which
> 	helps codegen generate exceptions even for quiet NaN.
> 	* config/arc/arc.c (arc_init_reg_tables): Handle New CC_FPUE mode.
> 	(get_arc_condition_code): Likewise.
> 	(arc_select_cc_mode): LT, LE, GT, GE to use the New CC_FPUE
> mode.
> 	* config/arc/arc.h (REVERSE_CONDITION): Handle New CC_FPUE
> mode.
> 	* config/arc/predicates.md (proper_comparison_operator):
> Likewise.
> 	* config/arc/fpu.md (cmpsf_fpu_trap): New Pattern for CC_FPUE.
> 	(cmpdf_fpu_trap): Likewise.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  gcc/config/arc/arc-modes.def |  1 +
>  gcc/config/arc/arc.c         |  8 ++++++--
>  gcc/config/arc/arc.h         |  2 +-
>  gcc/config/arc/fpu.md        | 24 ++++++++++++++++++++++++
>  gcc/config/arc/predicates.md |  1 +
>  5 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/gcc/config/arc/arc-modes.def b/gcc/config/arc/arc-modes.def
> index 36a2f4abfb25..d16b6a289a15 100644
> --- a/gcc/config/arc/arc-modes.def
> +++ b/gcc/config/arc/arc-modes.def
> @@ -38,4 +38,5 @@ VECTOR_MODES (INT, 16);       /* V16QI V8HI V4SI V2DI
> */
> 
>  /* FPU condition flags.  */
>  CC_MODE (CC_FPU);
> +CC_MODE (CC_FPUE);
>  CC_MODE (CC_FPU_UNEQ);
> diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
> index 28305f459dcd..cbb95d6e9043 100644
> --- a/gcc/config/arc/arc.c
> +++ b/gcc/config/arc/arc.c
> @@ -1564,6 +1564,7 @@ get_arc_condition_code (rtx comparison)
>  	default : gcc_unreachable ();
>  	}
>      case E_CC_FPUmode:
> +    case E_CC_FPUEmode:
>        switch (GET_CODE (comparison))
>  	{
>  	case EQ	       : return ARC_CC_EQ;
> @@ -1686,11 +1687,13 @@ arc_select_cc_mode (enum rtx_code op, rtx x,
> rtx y)
>        case UNLE:
>        case UNGT:
>        case UNGE:
> +	return CC_FPUmode;
> +
>        case LT:
>        case LE:
>        case GT:
>        case GE:
> -	return CC_FPUmode;
> +	return CC_FPUEmode;
> 
>        case LTGT:
>        case UNEQ:
> @@ -1844,7 +1847,7 @@ arc_init_reg_tables (void)
>  	  if (i == (int) CCmode || i == (int) CC_ZNmode || i == (int) CC_Zmode
>  	      || i == (int) CC_Cmode
>  	      || i == CC_FP_GTmode || i == CC_FP_GEmode || i ==
> CC_FP_ORDmode
> -	      || i == CC_FPUmode || i == CC_FPU_UNEQmode)
> +	      || i == CC_FPUmode || i == CC_FPUEmode || i ==
> CC_FPU_UNEQmode)
>  	    arc_mode_class[i] = 1 << (int) C_MODE;
>  	  else
>  	    arc_mode_class[i] = 0;
> @@ -8401,6 +8404,7 @@ arc_reorg (void)
> 
>  	  /* Avoid FPU instructions.  */
>  	  if ((GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUmode)
> +	      || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUEmode)
>  	      || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) ==
> CC_FPU_UNEQmode))
>  	    continue;
> 
> diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
> index 4d7ac3281b41..c08ca3d0d432 100644
> --- a/gcc/config/arc/arc.h
> +++ b/gcc/config/arc/arc.h
> @@ -1531,7 +1531,7 @@ enum arc_function_type {
>    (((MODE) == CC_FP_GTmode || (MODE) == CC_FP_GEmode		 \
>      || (MODE) == CC_FP_UNEQmode || (MODE) == CC_FP_ORDmode	 \
>      || (MODE) == CC_FPXmode || (MODE) == CC_FPU_UNEQmode	 \
> -    || (MODE) == CC_FPUmode)					 \
> +    || (MODE) == CC_FPUmode || (MODE) == CC_FPUEmode)		 \
>     ? reverse_condition_maybe_unordered ((CODE))			 \
>     : reverse_condition ((CODE)))
> 
> diff --git a/gcc/config/arc/fpu.md b/gcc/config/arc/fpu.md
> index 6289e9c3f593..6729795de542 100644
> --- a/gcc/config/arc/fpu.md
> +++ b/gcc/config/arc/fpu.md
> @@ -242,6 +242,18 @@
>     (set_attr "type" "fpu")
>     (set_attr "predicable" "yes")])
> 
> +(define_insn "*cmpsf_fpu_trap"
> +  [(set (reg:CC_FPUE CC_REG)
> +	(compare:CC_FPUE (match_operand:SF 0 "register_operand"  "r,
> r,r")
> +			(match_operand:SF 1 "nonmemory_operand"
> "r,CfZ,F")))]
> +  "TARGET_FP_SP_BASE"
> +  "fscmpf%?\\t%0,%1"
> +  [(set_attr "length" "4,4,8")
> +   (set_attr "iscompact" "false")
> +   (set_attr "cond" "set")
> +   (set_attr "type" "fpu")
> +   (set_attr "predicable" "yes")])
> +
>  (define_insn "*cmpsf_fpu_uneq"
>    [(set (reg:CC_FPU_UNEQ CC_REG)
>  	(compare:CC_FPU_UNEQ
> @@ -338,6 +350,18 @@
>     (set_attr "type" "fpu")
>     (set_attr "predicable" "yes")])
> 
> +(define_insn "*cmpdf_fpu_trap"
> +  [(set (reg:CC_FPUE CC_REG)
> +	(compare:CC_FPUE (match_operand:DF 0 "even_register_operand"
> "r")
> +			(match_operand:DF 1 "even_register_operand"
> "r")))]
> +  "TARGET_FP_DP_BASE"
> +  "fdcmpf%? %0, %1"
> +  [(set_attr "length" "4")
> +   (set_attr "iscompact" "false")
> +   (set_attr "cond" "set")
> +   (set_attr "type" "fpu")
> +   (set_attr "predicable" "yes")])
> +
>  (define_insn "*cmpdf_fpu_uneq"
>    [(set (reg:CC_FPU_UNEQ CC_REG)
>  	(compare:CC_FPU_UNEQ
> diff --git a/gcc/config/arc/predicates.md b/gcc/config/arc/predicates.md
> index e0013b32f0f5..4d2ad7ba6789 100644
> --- a/gcc/config/arc/predicates.md
> +++ b/gcc/config/arc/predicates.md
> @@ -439,6 +439,7 @@
>  	      || code == ORDERED || code == UNORDERED);
> 
>      case E_CC_FPUmode:
> +    case E_CC_FPUEmode:
>        return 1;
>      case E_CC_FPU_UNEQmode:
>        return 1;
> --
> 2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
