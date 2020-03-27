Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1490AC2D0EC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7492071B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DO6fbWHZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ay+vg6jg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rqHwaL4L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7492071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7LNXA8vVJIeqX/w03qbxsCeFNGandksxX31W2aRCiY=; b=DO6fbWHZXCp6Jj
	sKoZ/IXTw3O6kj9gYyCoAkf9kNqa8fklxFOkFMP+g2/EnncGmd4V6Kc2DWZOGOx0/72jc776VKOQF
	oHrB7//1fz8EXG4823QAz+SVJzEOjFPkeFeWkohUrGiqSxZdBp5wtVGvhmQV15bSBqr1Czu9xHEGi
	R7QT/dxrb3REbSwZzFFwWi4e1zihtKOL2Bbv+I/0SmKC2DxvCwOwCs3Wrr+j0iY+b/07oUAmo5Tf8
	7e35bJGwGC+9ieXroMb5WG4M+kO80Uxn7Iy38fb/B/9GHRpM8TK50xn66z79aRYjEiBLtYrRqR0o+
	STCGGevuf/XMsUdPld4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHyqV-0003V6-RV; Fri, 27 Mar 2020 23:57:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHyqT-0003UY-OW
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 23:57:03 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56660C0FB7;
 Fri, 27 Mar 2020 23:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585353421; bh=6IvcOYhhCa0Z6pgXBve9u7S4xEbj6nEUGUyClc54yo4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ay+vg6jgYdeLhfVIV8L1U6FmzLQRtjhrK1xjj6Zs94JSVVshtsgHPr9HNHr71gG6K
 x7ALcdludK1PdyT9Ar8MvxnwptygHZ8z3/WoiImL1XwBW6aozZ6xVoHkWR5TaBVODW
 Jd8lDZYzEt9FwRPkXe8BC6KGV79/DRjGRfYsAzD4rY0r3Ycb9hYwJ0eN2xNJhyETcN
 6ZAIvCKhYbthnRofXgPZMOhf88UKkHcf2oxC6Lg8SAO9nsSWPf7nUa+C2La/+0++nF
 InXEu7j7CBhozpBalng2hD35P1YvGw8vR0fompLDuNAV57ITj/eDSX4e5jRZpjkbjC
 5hou/GyHVIqDQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E9FF2A008A;
 Fri, 27 Mar 2020 23:57:00 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 16:56:47 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 16:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY5KQo07QQYrBPdG0kpuOl56OvEOu5jWgQvQ7m5gXpvmhqXQDxIWU7Hc38JsgQmB373eYNv4TFGEfmRo7J1fIWy0EmBlCwpFZtMSikEmfg91ijkV5ANUpcJ1FoU4c5N5Sj6tJ7eivn/89xxYPQkHC9z5mVY6m931hh5Be177EistOAg9saMgdpsFLxLext2MSfj+oVkfw92rn81mF7/24T3OHuqdERAGDrndOgAmy3zid/DTyDcB8JyRwo8BfvfKTJS+ozvjr5yBzmCC+XgP5ELBl7nZf1tPbbjDd3HoeSZUBtzpMhM4E82qg3aTmIDVsnEBf+8me4uJT8vrYfi3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IvcOYhhCa0Z6pgXBve9u7S4xEbj6nEUGUyClc54yo4=;
 b=WGxFrP7uklePSngYNHxFq6TSBP9VOjuNGDtqYSoolrHFQE6Cs0bZDQs1bvVEyizdbyoX+7cjTqawcuo4WxyUAp1QagFJvrZxk3utxAAwiko1NZRGtPsgpCne2YzpXdaI60iF6RYUDwv84feMDnPcSQkbau/5VP6q62bl5PYU4Wo8yjFcFmp2opX31hwSCyhZY3cFt7nlKJfZi1elGNG3wc8ZoEalGxboiW7/0aIan+IY1ysxA6JWuLBdj0c0iUrsDROVGPg2S5xNHrCy2xxar0J9Vx2lyTxltj8C0Fla1NXcsui3dM0WMyU0i13AYg4nKBFO8qnEWeAMM5BWMduAZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IvcOYhhCa0Z6pgXBve9u7S4xEbj6nEUGUyClc54yo4=;
 b=rqHwaL4LP8ts/Bayg5UOfZOqSAqoI/QuM7UQYwgJTUOoX9kgtfYkcG8gAz6na+2fz5U4tEvuugfa+WH+gb1SXioCV8ghGcfITFzz+pja3W43njeKJ/m9GNUSamj8FMHiDWnq5PqMhR2lGs5e1lva6kIQSK9ntwOwvER5j+F97wU=
Received: from BN8PR12MB3588.namprd12.prod.outlook.com (2603:10b6:408:41::13)
 by BN8PR12MB2929.namprd12.prod.outlook.com (2603:10b6:408:9c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 23:56:45 +0000
Received: from BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::4949:d5a2:2d8e:d124]) by BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::4949:d5a2:2d8e:d124%6]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 23:56:45 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 15/15] Documentation for ARC port
Thread-Topic: [PATCH v4 15/15] Documentation for ARC port
Thread-Index: AQHWBIn73jjsansppUuk0UaVBusJT6hdHaeA
Date: Fri, 27 Mar 2020 23:56:44 +0000
Message-ID: <fb36f261-f20c-77cb-acf8-1ec82aa9c93b@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-16-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272247560.5132@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003272247560.5132@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: a99f5dfe-23fc-495c-6c0e-08d7d2aa813a
x-ms-traffictypediagnostic: BN8PR12MB2929:
x-microsoft-antispam-prvs: <BN8PR12MB29291C5DBBD1B0B31482010DB6CC0@BN8PR12MB2929.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3588.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(376002)(366004)(136003)(396003)(39850400004)(2616005)(31696002)(316002)(478600001)(86362001)(54906003)(6916009)(6512007)(71200400001)(4326008)(6486002)(66476007)(36756003)(186003)(64756008)(76116006)(31686004)(8676002)(66946007)(5660300002)(81166006)(966005)(2906002)(66556008)(6506007)(53546011)(81156014)(4744005)(8936002)(26005)(66446008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: soencOK6ecxlgAUiq4WNjKGKGUdB7XkGujFIlMmprjUYlMnfIFelumQR1HjAYod6Cc+lZUWeRr6Nm7Il9kMhk9NIbmnq9lhSYhpAyvTRLEG+Tmi51QqpVOWwcf+yOWCv3GUyjs0HMugp8vpfewFPMGQeoYOd3QCGHt2gcBDa0Kv4Lh8117FIfGAPGY6qDwpFKGjwWgS2k2Z4sV7K0D87Bt2vXGgM5GO8IXvBy0g9jIT0mFlFj5YE36G0vt0uPFhynqdk6tsjO0BMFCkkH4L9/p+nGn5gFq0tNU/RK1N0JFvnCtmLe/l0MZb4yAp3mZGzgr7pa8fawu+uj1ZYAF+b6MjpKJIYk3pNlNNq+3XAg/P9dY/UV1ufZDoajDNKaNo5uuTL/4AE8qlucbnJ+EYLpVGyT0b4i0PAsR6OfUHOHQ7QDUUbOZ3AENljFoBA0XPpEK24B/ah3Ldo4gzy+vN9LXZ2d6o4w1ebJamE8T/vO5FECA1HWjfTh1FfRDo8mK8YYTUle53JcdXkBO6MKWzHuA==
x-ms-exchange-antispam-messagedata: c8s3Dkj4MoHzo6w/6eq3+5JT+pjFws7zzKGSqhk/RfzlLkgBGIW1jpUkgNyn3hCeW/81fXFodtnOtxSPhVoDzeoOyzeeR5YrDJtnnzTuj4XXKQOKN50attI6YgwL8F8ydJMD5Iox+g+124mBafKmcQ==
x-ms-exchange-transport-forked: True
Content-ID: <9D9ED35CB666BF4B854E0E394CEDE50D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a99f5dfe-23fc-495c-6c0e-08d7d2aa813a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 23:56:44.7269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vk12Il5REeqetwtmCk4AL7071b6qtQxpwGxV2Hxm9a/CCPZuWNKrOGC2zx4GEhLtaHFfeM6ox6PCOx2kX34w9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2929
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_165701_872105_B45EFCED 
X-CRM114-Status: GOOD (  11.29  )
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

On 3/27/20 3:49 PM, Joseph Myers wrote:
> On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> +* Support for ARC HS cores running Linux has been contributed by Synopsys.
>> +
>> +  Port requires atleast
>> +    - binutils-2.32 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
>> +    - gcc 8.3 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
>> +    - Linux kernel 5.1+
>> +
>> +  ISA: ARCv2
>> +  ABI: 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2 (compatible with
>> +       hard-float builds)
> I don't think the default of the dynamic linker name etc. (which should go 
> on https://sourceware.org/glibc/wiki/ABIList) belong in the NEWS entry.

OK, at the time port is ready and about to be committed or now ?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
