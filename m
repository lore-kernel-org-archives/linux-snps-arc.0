Return-Path: <SRS0=gW0p=5I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB3BC3F2CD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Mar 2020 18:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4FC2051A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Mar 2020 18:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4RqcsTf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YGrY9CYw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lTrH9zb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4FC2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbX8R2xgNXTZIj1X1ageI3vu/b9tMjFtdPiN1htIynY=; b=X4RqcsTfslJigR
	V56rTZKBooMHJ4tbjcY7ZVeRoh1cviIOg6bh3PmeYM0oK2s9rMb9gqfp5XP6KxtLA8RMjpsCJtQvm
	XvMmno0ZgqVaGn8uBwT5ol8f88HLivw8K+2AlT8oKXABD9sILgcwb6czX2/B5/r+5tVHMR201zEie
	D5gSsiEAB0gq1qaq3iggwY9Zf3RMzRps6EaRsQIPve+25zguNxObegHWJOtJlC+ZT1xK8EvDcJTXH
	SeVVbUTQJAkbYXz8CBq9ut7gPBbpDWAX8kDdBDtzcesqouA9APv6gFeOgkpjIwtTa8QJIxbZdZ2VD
	EMjhImGewqnbM3HjySlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGRgt-0005p2-5X; Mon, 23 Mar 2020 18:20:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGRgq-0005ob-Iq
 for linux-snps-arc@lists.infradead.org; Mon, 23 Mar 2020 18:20:46 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 73A21402D1;
 Mon, 23 Mar 2020 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584987642; bh=/h54zpG92JwSWlzfrxXwWJb3tdpAdK0at9A13/KiK2w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YGrY9CYwgjFqh5JFFALUJPq5+6LFp710nlJ1rstVxlRgxlS9in/P2TaPLhLm5e4ln
 ECvQ2w5ddMFWLEvUoZp/yroU/q4OMsz8dbPjXMLTgDNU4GBZJKMJCEm/mbPYr/VqYR
 ZrZol8x28v21yunoQtIGHBOHHWbjQP6mTomRoVGXzG47Oxxdjfj2haxgrRxh2Dv8dD
 GNV6z8hGpm7sPnuID3JGGFHSeseUrPvFZKamNm6R2Gm3e+3gkRlWzSjaGPlvS84/co
 K2W/doyeDUkACp1zShzoHUqwj+CWeuRgoaFRa2vL16gu2HVcdirrA78IodzKr2Q/Oj
 16LvWlLYeJJyg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D4B27A008A;
 Mon, 23 Mar 2020 18:20:37 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 23 Mar 2020 11:20:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 23 Mar 2020 11:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUvT5sinjV/arhd2aQrqMiZ4RC/ti3NuFqAU32XEPB/Y/LMnynl8c3xdFnpT7pe9ehYpJp7RsNH2iQgpok5Zelwtld9dqK3Z/hsHZPxk4V+EBsLHfCq4ipPTU1ZuoFp+NzYGH4hyR3IseOilUsCe2cfx4RmNEPM19FQycPa9wPvQMSZ/MRzBt0XuKcxZeSYzCQ8x4rWQwZmychzy73VnQfSCNnhbX52wQ/ctulolJSpwQ83/TMkvE7rRDtGSH23DifZifKJnzHqWDdBgk9UsFGpukUs/M9jfnvgTJTraFGdmGEqZBBo4tZ/mjxxB/Ikyde8/Squs5EUnFDs5Exxkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h54zpG92JwSWlzfrxXwWJb3tdpAdK0at9A13/KiK2w=;
 b=FekQrlRR1PQxHV6MU7pBQHSgTdTDnhtGU4KJpSr+Ms5wlvciHexmZtK/a+7F3Sj18hZO1WCcYqkExwljxbwbSDQm48CSrlY+/JSzlc9VB1vdKbEVjK+FcaSZTScgLoPXR/wnizqiiLii5RZOxKm19B9VzWqqCq4eCMRTMOAlyoA5oB2ozkXD6pXesQ9xCZ7UIjWnpC9yrVKmszE6EyHl7560DDLASlgs8Lld1230UxxC1F2MtDP8t0SRWCT1T/aAPO0a7uO2qTVYodxgzQl+AuAn5EjecDaTvjPCDhZ+UyJTqi47ahibi+A6FFZbKTCkXeES52sGidYmNvRrPzJ6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h54zpG92JwSWlzfrxXwWJb3tdpAdK0at9A13/KiK2w=;
 b=lTrH9zb4gxelY97aUjX0gsBHBvhUbZUJXzJR+Z6invZyklao2+NjaVmaXW4xEXxfGmGSBmttbjsMaU3FQJTHTBlP1uClO+Lzpcwz+XQiTo9pkG0CuGu5FbfbdUGyP6RvYuu7/S/BFL9WXbBPBpYIKTLmcUo5DHtPI/L6cb5DNNc=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3591.namprd12.prod.outlook.com (2603:10b6:a03:dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 18:20:35 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 18:20:35 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 00/17] glibc port to ARC processors
Thread-Topic: [PATCH v3 00/17] glibc port to ARC processors
Thread-Index: AQHV8+SKFbj1Ab7BHEKnet7tWnF7XA==
Date: Mon, 23 Mar 2020 18:20:35 +0000
Message-ID: <80805571-0d75-a298-873b-8f4ab93db9bf@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070020370.26274@digraph.polyomino.org.uk>
 <cc9d1b80-1568-f658-ce65-fdacad669956@synopsys.com>
 <alpine.DEB.2.21.2003070108590.26274@digraph.polyomino.org.uk>
 <7ac0aa7f-9c1c-d889-a087-2608932091b2@synopsys.com>
 <alpine.DEB.2.21.2003122145000.1240@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003122145000.1240@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce2f21e6-e635-4857-653f-08d7cf56e1a9
x-ms-traffictypediagnostic: BYAPR12MB3591:
x-microsoft-antispam-prvs: <BYAPR12MB3591AE560019B9A5774C9B80B6F00@BYAPR12MB3591.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(86362001)(36756003)(6916009)(66476007)(2906002)(8676002)(5660300002)(4326008)(2616005)(186003)(478600001)(81166006)(81156014)(71200400001)(31686004)(31696002)(6506007)(53546011)(6512007)(54906003)(66946007)(64756008)(66446008)(4744005)(966005)(6486002)(8936002)(26005)(76116006)(316002)(66556008)(533714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3591;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mhnnj64AlLNNO8Bd+gTvGN3GFRfmL8U9Qzh4YgKgwy82mo6xSc2puNQZ+rCPWKTHr3IRa9nlWBEVaxaZhV9fyWWb5xX2n9KGCaI9WlfrnqTmZFFJTIeIkhHOBeG3KUqiD4mxRwTRbbX18TLGwjjyvjCIX5w5nf8R9u47PjD9azXMThltid7zgKvokirLqC5dkaBC3JLet0v8rFusRox7yfeXmBeVtCdUdnowf7i9eDNc1C8zdi/h6cFvmmSlAMY49P4XGJF1guABeYde95MkcrAjDBbhocxFYMORDokHg8jESA25l58Xgcj8fEcFGv25yE2EDz11BVoWA9k9h5ew3uSAv976nSNr7z8lMg1yQBgJGf1Y7ZlQu5n30Zi4SEVAdvNQCgWJJVVRX7Y9AzjHK8Xi+slqQiETP4J9eCDJvoStcmKDtsdJgCWLVJSBe530B+kIfGtKx5+SqyjajTUnUtpe31YaDfelOIz2qkZtRvef/b8r0fKEeOmzefevXUR56MNr7b9QlJoUzORWs+VSmTlZfWM8xQKCHy3kubeUJf9mXwEqnjSops0AgdXCxsd02/fqQ+I3v1hmc0xvaq6mDg==
x-ms-exchange-antispam-messagedata: /f+B0E39PnOqZ2tZQjSM/2tldoj0NkTpAL8EpoW7jfi23i5yz3rOJefsw5gy/iCYBpGqQGjjDyMneVMtTzZDZVkf/b1cfbW9ClEKJmqqE9NZ/YssGRoNnoBZ2mSUYFuL0klyy1ydr9q44QmyPEib5A==
x-ms-exchange-transport-forked: True
Content-ID: <B8FA85B4AAF66446B3F8C99AEB30942E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2f21e6-e635-4857-653f-08d7cf56e1a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 18:20:35.5067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZzWuXr5unsGBzGitAjlD2UEpkzNDtXbS9P/OQQQgInG8LRIYoEsOowpDgTOObxILLbXLq7HXlQpeaIAwiVUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3591
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_112044_663307_9A72C300 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Joseph,

On 3/12/20 2:46 PM, Joseph Myers wrote:
>> Are you waiting for me to fold the 64-bit time stuff and a respin for a 
>> more in depth review of the patchset. I appreciate you have a zillion 
>> other things backed up on your todo list :-)
>
> The patch series definitely needs revision for the issues I mentioned, 
> yes.

I've addressed all the review comments on v3 and posted a v4 [1]. Can you please
take a look when you get chance.

Thx,
-Vineet

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2020-March/007127.html
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
