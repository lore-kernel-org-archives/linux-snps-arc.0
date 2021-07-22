Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3210FC6377D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF3B6109D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF3B6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEXNtGM3D4hugl3U+e/uZ9/F1I3SyxNo29dNfNr3pfY=; b=OEtP6pXgcN/c5z
	6Hu/cR3XJ23IoPlER687FjOFZrA3WUXy/eMo4qMYV4rvsguN1OATiZ48Wj07N6GNanyPOvHtkdezA
	xwUG44almDeucHN+AFxMLZjnweEqrF72fyy58usIy29tMHEhP36kNv1UeEzFK8+/h9wfqJnc8Wrzj
	U6pMTQ4HApCQMacf09vttsx1zcLosziu3Zg8C48ZsNUXAaG5Jdkb9ps8ycR/0/PGsa/yQzRpUBT0J
	VcsvuUsBDXjGyXOU5sH0b0M8JuIRnYpZV8kjcu61HLudVPB/BMxJlkhapCPGkW2rJk61hT+fWbpzc
	H/xTd19Q4r6g+2bQu7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ZE8-001o3n-9l; Thu, 22 Jul 2021 13:59:04 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ZE5-001o1z-2N
 for linux-snps-arc@lists.infradead.org; Thu, 22 Jul 2021 13:59:02 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ADBBEC0D14;
 Thu, 22 Jul 2021 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626962339; bh=TqqQ8PQq0UkdkDuZ23Kjyn7SJWZ6H6Jcn1v9iP3l7v8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dPHfJEqX5ZTfeohkm6wgOkWgJ97LtCIMHQa97LXFrGuLjfzGAGNeFX0EEhaI2Z0JF
 3+C1O1z9tXiMfGaGVip2F9FZhOMwMmFtdNZAWZcwHuCLqhHzWa2ZF1GI/I8Cy7TVed
 FGJ7WM3NPeG3XGJaPy5phq+DLWK7vQCfWLne/oRwv3s6hGuCGWE4yR9drJPXSCy8vj
 S7oZ1CTr85pP8vx383JeijkeafmhaCwfYaIk5vfUkRH/KxD9hXRlki7mYvS4q7E1PB
 AULijLLsW6KAlTZrRjHiVwL0YKaZB6E/ULXB5UYJ/IPiJJm+DVfJGI+6oejZDSY+jv
 oSoZXSfx6nhbg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C7097A0081;
 Thu, 22 Jul 2021 13:58:56 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6174040200;
 Thu, 22 Jul 2021 13:58:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=isaev@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="e4Ehr8Hn";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXeipp0ocm9o8XgF7mkUWDqbU2Wf7DTBYy50vja6msjleCeWZn38xc4bWTaH3YHspe8ehHfuo9GrThqCaqy8Z1PxW54hqHXaMUeH5Meo3sqUiEP4cYW1c05yH17QeBTYGle+6Esul3dn38LrgyJIWWsTGuutuSTRXVL0xHrc1aGhJG1AlelYhrlWZS9FxRHaPrIll6ZEdAy1KSTXx6EkDKAqPL48XeoBXbf6SOXiGhHRZl8PWyKBR3wbAACezcfBhbQZIMaQhJX6UBxSlVVX8zGekn/ws7otSQv1yGTVBg6xtemeV4Logj8iisP5C3WUUdzptET89T/gHvqkMITKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jQo2a0eT7fsP5ZJ9EPANJlBH7J9l54fsxHqT2+9qo0=;
 b=UaaWrsGilsYMD9l/PxLJZ/WO07+LAwuvNYV8ahrf7N1D0zjnoXKLD2ndeyj6RDT7g5eFslAaArTdD8f5BFk7mNGOhsQBIbA5rN03JzuAFTVVUraHB3vQpr654WK7chquTcJMpAvkZQkFwVSXJ4fYEvOwYSiLSTl64fVYswLkRbSwpTxBEQ4TShaciUSBrW2zC1VSQbwvGoysdxYjx2LDqthwbCsV3sKjawsm4Ve/6N+lD9cG7zQFqkixxSHoCSMY/9nYQrgqJGz1nmu6Jts2TnKeoZs1VkNZ4leyUMeSCuNRN67hXsMI6hLwsYWHY1N3+t4JgqL5br/TVLf9IZ3yjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jQo2a0eT7fsP5ZJ9EPANJlBH7J9l54fsxHqT2+9qo0=;
 b=e4Ehr8Hn3o9dsNhEZA2FTux2ViVszsAF1m9mqgi3xf4LWzcOfRfD9d1wYwVwGRAkYAry3B9GTot9MQjpzPzuxiU30GLrAIOJYcdPNvgk1Vbmy3PteyWXc6qY6mqakslTV6VClFBlPClUPw2Tlr3PfEtnayIgDNxS2Z7EcdUeKpo=
Received: from BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 by BYAPR12MB2981.namprd12.prod.outlook.com (2603:10b6:a03:de::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 22 Jul
 2021 13:58:53 +0000
Received: from BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::8459:b572:85e3:f2c6]) by BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::8459:b572:85e3:f2c6%5]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 13:58:53 +0000
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: Andreas Schwab <schwab@linux-m68k.org>, Vladimir Isaev via Libc-alpha
 <libc-alpha@sourceware.org>
CC: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: RE: [PATCH] elf: _dl_fixup*: make @reloc_arg 64-bit safe
Thread-Topic: [PATCH] elf: _dl_fixup*: make @reloc_arg 64-bit safe
Thread-Index: AQHXfvyjt+SJkAZQuke8T0w5CdB4gqtPADBFgAAEQpA=
Date: Thu, 22 Jul 2021 13:58:53 +0000
Message-ID: <BY5PR12MB4131E40A7C1EB2F154F36A30DFE49@BY5PR12MB4131.namprd12.prod.outlook.com>
References: <20210722132200.43895-1-isaev@synopsys.com>
 <874kcmzcur.fsf@igel.home>
In-Reply-To: <874kcmzcur.fsf@igel.home>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcaXNhZXZcYXBw?=
 =?us-ascii?Q?ZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5?=
 =?us-ascii?Q?ZTM1Ylxtc2dzXG1zZy1mMDBkY2MzZS1lYWY0LTExZWItOTdmMS05NGU3MGJj?=
 =?us-ascii?Q?MWZjM2JcYW1lLXRlc3RcZjAwZGNjNDAtZWFmNC0xMWViLTk3ZjEtOTRlNzBi?=
 =?us-ascii?Q?YzFmYzNiYm9keS50eHQiIHN6PSI3NTEiIHQ9IjEzMjcxNDM1OTI5NTM5NTEy?=
 =?us-ascii?Q?MCIgaD0iajBBb0pOYkwzWjc0Y2EzMHpTZXNvSU9uTm8wPSIgaWQ9IiIgYmw9?=
 =?us-ascii?Q?IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSFlJQUFBd1JX?=
 =?us-ascii?Q?V3lBWC9YQVhpYllONGpmTEhVZUp0ZzNpTjhzZFFOQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUhBQUFBQUdDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVB?=
 =?us-ascii?Q?QVFBQkFBQUFpTWxVSndBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJnQmhB?=
 =?us-ascii?Q?RzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhRQVpR?=
 =?us-ascii?Q?QnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFB?=
 =?us-ascii?Q?QUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdCd0FH?=
 =?us-ascii?Q?RUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFB?=
 =?us-ascii?Q?Q2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0JsQUhJ?=
 =?us-ascii?Q?QWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhBZFFC?=
 =?us-ascii?Q?dUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QnRBR2tB?=
 =?us-ascii?Q?WXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3?=
 =?us-ascii?Q?QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUhRQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxB?=
 =?us-ascii?Q?SElBY3dCZkFIUUFjd0J0QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFk?=
 =?us-ascii?Q?UUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZFFCdEFH?=
 =?us-ascii?Q?TUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR2NBZEFCekFGOEFjQUJ5QUc4QVpB?=
 =?us-ascii?Q?QjFBR01BZEFCZkFIUUFjZ0JoQUdrQWJnQnBBRzRBWndBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQWN3QmhBR3dBWlFCekFGOEFZUUJqQUdNQWJ3QjFBRzRBZEFC?=
 =?us-ascii?Q?ZkFIQUFiQUJoQUc0QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6QUdF?=
 =?us-ascii?Q?QWJBQmxBSE1BWHdCeEFIVUFid0IwQUdVQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFiZ0J3QUhNQVh3QnNBR2tB?=
 =?us-ascii?Q?WXdCbEFHNEFjd0JsQUY4QWRBQmxBSElBYlFCZkFERUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFHVUFY?=
 =?us-ascii?Q?d0IwQUdVQWNnQnRBRjhBY3dCMEFIVUFaQUJsQUc0QWRBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQjJB?=
 =?us-ascii?Q?R2NBWHdCckFHVUFlUUIzQUc4QWNnQmtBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUEiLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14fff913-6ab1-499a-b63f-08d94d18d72e
x-ms-traffictypediagnostic: BYAPR12MB2981:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2981334C03F0E384EF5FE43FDFE49@BYAPR12MB2981.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 59RMMUpKgi9OoBZZu2uxz7mibIYydk+1Iam7sOwMWZUPLKAxFE3ovvaAgA0O8CQC9iXoJKEnLDNW8xViddEoQmxH5bnYBnLMIAoBq74NLmUf63I6jra7fK7SiWJUTqZonDdNH/FXMHML7UJzClCK07cWJQj9ENnIsFxRtlZ3TFSqAG49yoACROzxa2nphGdgo3jHa0pk7P6bQSHGmpRdXplCRAoqLvZyHVp78cvQEAIL/AE1JCMMEnsenXcoEfMc6XZX9tT40loiOcBh2gbDywkBkhmuv2WKJmN5KFYrlAqpxP3b9x7XSBeR4c1jUsxr5G86zwAgMAZA00+OdobBKQlq8HO425EPd3tA/ogjKvx+rL0bLQxx0UfQ11RYwtYywx0MDu1Qbn+HlqXPLQEYxASx46Iaxlx+An3HTIcsXhN1/HzqZRcaQSMBdJxJKlJGufb66v2By9zNN7O5UFwEpeWv5vL6WHBp7dV7ZTBHOOw0BeJfxYqXpJ8J03lKHAGZ+2AsFRio+X6VpWIHRT4zt6AMNy1ZRlrwy/aCLFsXx2hA4JbYOZMmSUCND3olsWqfrt3yX66uXdhRTjzWiLDfOvU1BrKuiR5dU9S9K4g/8YvnT4HzPOgDH8KUxK3c/GrO6IKr3XCNxi05HIIZWeVSqaTnXi3/lRXkb60lK0RgSkQTSXv3mdChzdpE+XdHcm00IVbGTBdj0q3w+MZQLQeCnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4131.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(136003)(39860400002)(376002)(52536014)(55016002)(64756008)(9686003)(66476007)(66446008)(33656002)(26005)(76116006)(66946007)(66556008)(186003)(4326008)(110136005)(122000001)(86362001)(7696005)(5660300002)(71200400001)(8676002)(2906002)(4744005)(478600001)(38100700002)(316002)(6506007)(8936002)(54906003)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jyxFsNUNT724POE25iwRUxpmHWW7oXjYq3Zh1UgXB4EQySiiwnobckYPuTzJ?=
 =?us-ascii?Q?lr6EH4BHaHaXuxgnQfDT655O2akl+aKxt+shG0r50cHaSxcgAUfGyNZLB5ED?=
 =?us-ascii?Q?Iz50xKYYYBWJxAPu3dEg3183qSQCStDmbgYmhGF6hJr7ct7ZnFQYBZiaWBaV?=
 =?us-ascii?Q?hTCsfxPa3FJYSYUC7ICby6AzU8Q1c0TfMdBYAmysmS5tDRsr4cZ+cJA/JmyG?=
 =?us-ascii?Q?wR96tcWXm8Aev/zwsYb2d40Foz+h5Id4Ff3q4isIRiyPBDUteJh+f2gAeVYc?=
 =?us-ascii?Q?Vm5QlljQubVPDcPLI3w4yqCUJyK8rpHciM18fJErD8u8YsKhsi/NucYTMJ0r?=
 =?us-ascii?Q?NPDWj3FY3GWfTrpAyFTIE2HOx2AnrNlIS22EPUu8/aq+4FUTnyhjVLSB1udf?=
 =?us-ascii?Q?awVu2kpHm0Z5/c1I1q3LFSm33T8x9odRWswwQrILeDLsirz+iEaJmMR/J7nS?=
 =?us-ascii?Q?yMcEaAoKfWAXUjl403JtNRZsk2HlM3Z7yI1T7rPEMUcd3IDqzkEQBP2Poh7m?=
 =?us-ascii?Q?lPb+NcXlF9lpr0dAXPHRMja1EsKTsZfYIbYq7mFP4hRNrq3vNJVT9G6T63zC?=
 =?us-ascii?Q?5SQIsLvU0pZ4jITtzTNTXZoZhzVPiHdIoqGyK11X0QcnFkq5WpFzcXTW7PZK?=
 =?us-ascii?Q?XEraxZ4CZ/IKvJBi6fakULAeyhASMrjQfdOzqSd4fhDkcV5qm6KwuA3Y9jDP?=
 =?us-ascii?Q?6AgSsNE1rW7CjEOYZwT7ol6nKmFsYcSFV2hQCZZNemOOrsCratjeDjXfO/op?=
 =?us-ascii?Q?qCU9xNK8Ska3Y1pGtBEmp2qbiiakI31GH6vEnT4bcnPavd2zvUXBVfxsypA3?=
 =?us-ascii?Q?NmRXJ0T4Gtw8fSZzRLR8odHlHwm40zpnjUtpLqTI2a6g7lOR26rtfAiI2xJq?=
 =?us-ascii?Q?hhf0cOmFgprWzTfd3xdNwEB0gFV4b0lV3N3pAPWR2Fri+E5qEGZiNlR4ow+m?=
 =?us-ascii?Q?x+6DdLRMCx0wtZqB8XjkvbicNo4A43+jpegcnP+Cg2K6LhRm/b/3eKANrLVD?=
 =?us-ascii?Q?AQytwryEWphf9mYYp7s/R90KVoWgx/5PtJlRY2J3dmDWqCV70dSGJ0DKuvkn?=
 =?us-ascii?Q?qmlhUX67v+kEPGxIXj/eHbALM7oDwLjxnvA/E8RtNF/Sfclw4ufjeT4wnuYm?=
 =?us-ascii?Q?Qc6yO5nOlEGywc0WmACdVyrkVOQ8mrWLWw31yEKvobsG2ZqL0TXQOAXjNRXI?=
 =?us-ascii?Q?0k5007YmVBIay9l1wwDeAOvLiuFjLSf1q2EI4k8VsxWwz8G/teMoi4LkgXAI?=
 =?us-ascii?Q?ldusSwifzIoWvhv8IsEJljoLMGEWA1Vxl+iGxZu9gqKrP2sebqv8qud9uPzo?=
 =?us-ascii?Q?ips=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fff913-6ab1-499a-b63f-08d94d18d72e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 13:58:53.2819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqlBqD+9i4pqYoozglsfKqVS0m+V5pT0Ejx83FBDdbI5M4PEo+oqo6QlFxo1yFtYhBuyOcFphq+bevvTJSOq/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_065901_320124_72C545CE 
X-CRM114-Status: GOOD (  11.78  )
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

On Jul 22 2021, Andreas Schwab wrote:
> 
> On Jul 22 2021, Vladimir Isaev via Libc-alpha wrote:
> 
> > diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
> > index 9d0d941000..6099a44ffb 100644
> > --- a/elf/dl-runtime.c
> > +++ b/elf/dl-runtime.c
> > @@ -56,7 +56,7 @@ _dl_fixup (
> >  # ifdef ELF_MACHINE_RUNTIME_FIXUP_ARGS
> >  	   ELF_MACHINE_RUNTIME_FIXUP_ARGS,
> >  # endif
> > -	   struct link_map *l, ElfW(Word) reloc_arg)
> > +	   struct link_map *l, uintptr_t reloc_arg)
> 
> ElfW(Addr)?
> 

We can use it, but I think that uintptr_t is more natural here because it is used
in reloc_offset and reloc_index.

Thank you,
Vladimir Isaev

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
