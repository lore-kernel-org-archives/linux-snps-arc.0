Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5B0C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 11:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407AE20409
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 11:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YWXaL/GQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PMEIgwnN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jJWRzlyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407AE20409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkNhNxDEHt9/UgIKLox8h6rjwGAoyr47aXKM3ltfuOs=; b=YWXaL/GQrZosrK
	KAthrFrN7Zmnr3s7YhAyRzxy6r/W0k9TDympGt++Dx+fVCWUz9O7fjgPxxJIVbvQ5Hc9jIlnTNVKE
	8riZfa2pSw1qHWqffN+o3RHq/IT8Dw+ERpq0NIIQN3NV+svGp8/dd3bxDDj3A/VUS4Gb0m41de6fx
	2Fil8vKBnPkJ2UxA4rrP8U4ODHNLkE1i32ghRooRkUyQCQCjwFBEDO5/uoSbgsnK3zIQFV91Ksp8V
	OIodyBTp0a6hxyCrLKOfbZZCt23baFfJT0aNlUTAuzk2epq33ypK7ZoNjYN4XshiPcTJdO6a/iJHi
	ZF2/JQhB138KLFsd0Tlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHR3N-0002XS-HG; Thu, 26 Mar 2020 11:52:05 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHR3L-0002Wk-09
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 11:52:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E26EBC0F75;
 Thu, 26 Mar 2020 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585223520; bh=s1x6stcQLREnOZ3pmOHza7Q/4DPGQiUOsjh4ltEsyEg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PMEIgwnNZwkImkGbbIRTptGZfIMtkGkYMMV4YI7srX6k3E601+NSvj6T9a2kcmYwl
 hwgPP83xPOHoXtqr6KrBKkepqUiqXASL+Lz1+rFfewKpesp9qlAAu5yu0BwOCeb66l
 LqU5lyR8KKsABuZyic13uAFr1IEZqOEx1rDBD43xhoykPJ42TuOSEq3ajjx8CwNulW
 ONONUNHk3xsmjXLYEMXbKhFzwL7ym1PimI6IhRW3GylXw++u3nHFuJQ6ds8dtlJxWh
 zJnby5yTKV8MCBkcIv+TZdeFf+gVTTV8osFYJo9F9/SzEIMEVLm+nLo3g+wKx3TNYn
 l3aXGRDjq78aQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A3D78A0085;
 Thu, 26 Mar 2020 11:51:46 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 04:51:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Mar 2020 04:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsWZPiQAMH9fGDr/sL0bsEMszSuwsVHudCzJrZ2ElgmHewZBBwPJAvPnDQSoHt4oDb5wEoUTOwK8F7vyEPCh9Qp650WkHqtEKxxxNC+l0yUgJJIRr+01QrmOfi8wsL5aTs9P7sfruhd18AMtIWIK7C0FVdjjTTIPF+Uqg6ul39UYwcdHfOFzxpOLNmTCRj1xnhGj/KjNnZxXorp3lzwg2R6edVxjuSK3xaHemW7KjNIseXyrhQFFirVN4wAFM3mSyE1JhydWhXDWuS8RivkYuNeztm7LCiuyimjv8AqqoWNf7Ex5zlk/L/NUD5jP0U4PuKyShkMgwkF7TKUyPGKDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFYg9A3+vFMbMyIakcy+h8ELVvyvbCYlVACMU4nclFI=;
 b=EmEnoUx8/ha6AnNQDa6NYFuezxauWJ0HUrpGZY2i0MLQoEmNaF1o1ZIELsJiF+0rhl7Oa2lnQxa/LuFktLoX0uAlq8GpBnd24UYqTNa2NBOyQSqLLTwodWEnf4J6CIdiRwEKpDEKnPF4uafI/p6z3JsOHH8bBWsWmkV6DdCnf1OyN7D2UQo9Enn1QlbW1uuzm/4AVpcHvs73cy0gqyvP+0eaV5bj9ZtiFb0OgvQN1KQFi+NL6ZXRQ/4+rRnp2U8bAd/hmIExjTd2/0v1+Aw6dIZz0JuL9K0q/y+ScfKAQOPqwO313cVa5pivF6cCbJTIqRUcXDnkaq6zXAuSR8dT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFYg9A3+vFMbMyIakcy+h8ELVvyvbCYlVACMU4nclFI=;
 b=jJWRzlyijavCBMBbFUwCbZUMwGe6LNJPA7XXl2tpUCLpSMV9fFKE0S7RBhhmTT6jFbGPPN1jWwWZGSNvvN0yNh3oFzpUAWmEnNdwwf/rXpVWBHwzlfEOyfs4f+M5JWCRCqXex+VKESImdbgdjCi8+4ELHRX+eL02DI+8Kd/A/9A=
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 (2603:10b6:910:1c::14) by CY4PR1201MB0149.namprd12.prod.outlook.com
 (2603:10b6:910:1c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Thu, 26 Mar
 2020 11:51:44 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::744c:4e95:39be:9d44%12]) with mapi id 15.20.2856.019; Thu, 26 Mar
 2020 11:51:44 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Helmut Grohne <helmut@subdivi.de>
Subject: RE: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Topic: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
Thread-Index: AQHWAwU7mWE+WSIdT0ax39G7iS8+VqhaX+MAgABYcpA=
Date: Thu, 26 Mar 2020 11:51:44 +0000
Message-ID: <CY4PR1201MB0120B23B823811B061CFCCFDA1CF0@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
In-Reply-To: <20200326055408.GA31088@alf.mars>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWJyb2RraW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0yN2Y3OTUzZi02ZjU4LTExZWEtODAzNi04OGIx?=
 =?us-ascii?Q?MTFjZGUyMTdcYW1lLXRlc3RcMjdmNzk1NDAtNmY1OC0xMWVhLTgwMzYtODhi?=
 =?us-ascii?Q?MTExY2RlMjE3Ym9keS50eHQiIHN6PSIxNzk2IiB0PSIxMzIyOTY5NzEwMTk1?=
 =?us-ascii?Q?Nzk2NDciIGg9IjgvejRXTEJ0S1A0cXhpNitUNmxGZXBLVS91Zz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?RC9jSHZxWkFQV0FXdkRlOG1JclhET2E4Tjd5WWl0Y000T0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBTWpMczJnQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
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
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e9624dd-b67d-4f34-4eed-08d7d17c0e62
x-ms-traffictypediagnostic: CY4PR1201MB0149:
x-microsoft-antispam-prvs: <CY4PR1201MB014953F1217C5BC54AABC011A1CF0@CY4PR1201MB0149.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(136003)(366004)(346002)(396003)(33656002)(5660300002)(71200400001)(86362001)(54906003)(316002)(66476007)(66446008)(4326008)(2906002)(66556008)(66946007)(64756008)(52536014)(26005)(8936002)(186003)(6916009)(9686003)(81166006)(76116006)(81156014)(6506007)(966005)(55016002)(478600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0149;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cTYfA92O2iIR8NbX0zxI3UMhm1ok5KCcj1rccI82cDNT/9B2I4dA4FONlbQhQbV5ENlQm66Fqhcb3UpJo/qme0evi9U5ekE5yU8xe4XW8/BMvuD+3J43vMjAwyrfrhYAY8vbIQvik7YH0Pcpyyoz8tAoyH9dFw7h/y7gpGcXIba5/gAJmoWzWSHrj0uGsu1Jf5u2c8jYGWXFyyYXp+qEgd2QN7t2UeQ+HbcVGGkL5SbGaGKgwogVOc61nYRBAlNC7KeeohQ8A9K5hmQzdDUWkrBS/A0XW8TaWqX/qJd3f6VOF5ouEesMmu+JSBwhHlZPIKwBi9QOA8GEUisoLsOOoHH5s3kBr+eLknHwWXghkiPIunL560V8Y6eVuk/alQ5vg2Wge6eU7s7sYQSlorxYVLEpT9LCnyIs1xZZ6NQeXh4LJtU9CgpkWiWscKMNMqPH0+RMR7/JNl3ieB+VCPn88RfNQ8O8rLPMSVC6XI1+0RoKhc4S1zhNuP0NIdJJmtxKrNwT50ODxjMtbSSML2TI2g==
x-ms-exchange-antispam-messagedata: WygPQz30XcL22skdw8baThyTUDKF3B73NDmBn2uV9+mP9x2ErUE9chowSA6kz5qasuGC3cmOs6J1zqVbGvoXZqThjN4Zm8l/CkAnyWaABqL/5LO4ZSO49wF2E0ql0d6wsZI+0NcLbKOYzWq0cmSGUg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9624dd-b67d-4f34-4eed-08d7d17c0e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 11:51:44.2258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmxcCycD6I/s5+H5j11cUY0EVyTIr3tvYqlIcBpkbx9u5akq9Aw1ffdcEl4/jR01k8r627MMsAaWfi0DAr3kHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0149
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_045203_165708_A57B1FBB 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>, Vineet Gupta <vineetg76@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Helmut,

> On Wed, Mar 25, 2020 at 05:25:58PM -0700, Vineet Gupta wrote:
> > ARC glibc is still in works, but assuming that will happen in near future what
> > other upstream prerequisites are needed. The obvious ones would be Linux kernel,
> > gcc, binutils: all 3 of which are supported for ARC. From a quick glance at debian
> > wiki pages, I presume *bootstrap is mostly done native, so needs qemu ? (full/user
> > emulation ? And does qemu need to be upstream too ?
> 
> Given that I ran into the glibc issue, I can tell that at least
> rudimentary arc support support is already available in Debian unstable
> for binutils, linux and gcc. (Otherwise, I would not have come as far as
> glibc.) Once glibc is in place, work can proceed on the Debian side.
> guile, libatomic-ops, libffi, libgpg-error and nspr ususally need a
> little upstream support. dpkg, gmp, openssl, and perl usually need
> Debian-specific changes. I'd recommend looking into libatomic-ops and
> libffi early. The other packages are usually simple.

I guess almost all of the packages you mentioned already have
needed improvements for ARC.

1. libffi has ARC support since v3.1, see:
   https://github.com/libffi/libffi/commit/b082e15091961373c03d10ed0251f619ebb6ed76

2. libgpg-error has ARC support since v1.33, see:
   http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=48c8f8ddfc80
   
3. nspr has ARC support since v4.1, see:
   https://hg.mozilla.org/projects/nspr/rev/cc73b6c7dab2e8053533e1f2c0c23dc721e10b76

And only for "libatomic-ops" & "guile" nothing has been done yet so if there's something
that really needs to be done please let us know.

-Alexey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
