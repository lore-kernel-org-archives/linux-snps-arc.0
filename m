Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3382C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:36:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696432080C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaBeZ22Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CnsoQx4P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SgeFKp5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696432080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCzNkq/PvVp9CMab5q00omZlQsSyl8uh0+D5IZRzNzQ=; b=ZaBeZ22ZUaxDtB
	2u35R6RcXrtsHC5ZQ8pTMU51/9Z9LZxW0xq4LM/dy9fAAG3/2SgyhecbGmisgHrJepK2igzMVgwcS
	ljsKTOGfJI2Lw75++A92sL9btPwMF4flOLEnHfJ0pC68BhDRdX09hunT1ToYJszTdBOg4qIOq/q3j
	HdENlLJZ9YYQ2CMnJD7OejAE9E4mcin5R+t3LVx/NODdR/Zte4gswIAkNrC6xBRjeNWQbzXC0yHXY
	bP9peMpChwfW8xyfPM6jRVpYlpxcPjVDfV01SgsZ1Xxk5/hsQlV5eDJw3I27PLKoURk+0gApW8lQh
	YQNAgLYBK3wbzwkI3mXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOYm-0003GL-Jl; Tue, 31 Mar 2020 21:36:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOYk-0003Fx-34
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:36:35 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E5E9343B64;
 Tue, 31 Mar 2020 21:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585690592; bh=cZlCdF8xuMqX/RpTMJU7P0/+vzRWA/XMvhxU9CyIoKQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CnsoQx4PklAsUuSE6lHqViV1gIrfbn8fAFlt/ejYgorQIhDXkTsbbs2YNkBpFNOE0
 c2pe1Nk1JRkEfsv0COsNwlcvymzJ3tcC77d/D9h7tGGhffDssAa2M2cTd6SYe0qc0y
 wIREl5u5eRCwkRalKer0FTeNiORSK4bB71K950rY12uq60HaVgUJ7rZVLRoQTHMp9t
 +U40xmQbOK927wdNh+vRWKW48EhAqUTz+PzsdyhM/v0F+yGb88lGstN4B1bhJnYjMW
 eBmTkZc5sqAqXw/1MODWlIUU4he8FqrAhgsl4KUoWHRy4/CKM0clumsh8FzXMJJSJN
 WkvKuvG8sOGrw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6B14FA006E;
 Tue, 31 Mar 2020 21:36:27 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 14:35:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 14:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra5F9J5ZYbFvYmf14/bydbd6/3Yo57DsRN6t/epwIKevUf3gFHLjxShSbkq7nh3RodsBohYrSSi9izw9UjqB1aooumMHlgAbcuuUiWTPu0HvNDRrUW2MnFgHggAq3pLYalKG+UvgnOcANs11z2LfMqanoB3uthS4ZtuD2/h1f+g/z6QWR5bm0uwSMLgX7EbYna4aRG0HlWJDOrlNqSsLXTCl9dD3krq+WfUQQ8r95s/AcqD0CdzaryWxRTvDYgBOHNVaCGDvSpFr98MN0KR+oIeCEjpCM9IXz2Vy7NZfVleVH3NEIylSwVedg+F0volnGDuMWhfl+Jnz/gbHRVR1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZlCdF8xuMqX/RpTMJU7P0/+vzRWA/XMvhxU9CyIoKQ=;
 b=lp7tN/dey0VmStw7+6qCLqQxkfZRCknahMUmZPXHkog8zZZjeRmSz0uVRJjnvIdY+PygvDNBqbjOO04uvDD7qmGTAxn7Jj7Bl+P+ZqrX1//YrU8CefZ4qdxKtsFw5Lc6uHfDTWGdvOS7CKqFAeXIFFGo9ghfPIKRh5kU2GhyXGgNv/5/WhoUUE8Ihrzmgr8zjghnorP7XOnb9UpdfQ0oozCXHazqJHjRFhrG9NadFdDvY0KS0WDHRBtpv0+So6Rz3to869kKiKWr/UlSGCOPlY+dMQVkXYX3soVZ7MbyKK8f3NBnyl29w5LsIasEuKGQSSHOIHjj3xEkjdhC1fhS/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZlCdF8xuMqX/RpTMJU7P0/+vzRWA/XMvhxU9CyIoKQ=;
 b=SgeFKp5Tz0lZfu1KS4oOxsr27K5+eQ0EKRaVL+86bqlw1BXHdoBOY7KY/+T+ZTcZnuOpY+35oqL4x4m6P4bS/BbM1d2zqSrQIfq6eZNu0RkcH0eGdFFG0zMe06ZfB/yZT+gUXRwnoO61BRSVjo+jbgn67sRp9iSJaZduizPn/jE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2613.namprd12.prod.outlook.com (2603:10b6:a03:69::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 21:35:17 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 21:35:17 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: Big Endian support as multi-ABI (was Re: [PATCH v4 02/15] ARC:
 ABI Implementation)
Thread-Topic: Big Endian support as multi-ABI (was Re: [PATCH v4 02/15] ARC:
 ABI Implementation)
Thread-Index: AQHWB6CXh2O5M9kfy0mEaskESxV7GqhjNyeAgAACIoA=
Date: Tue, 31 Mar 2020 21:35:17 +0000
Message-ID: <9be80350-0ee0-c444-d0ce-cdfce73b8013@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
 <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
 <ddb994a4-f3f2-e789-7cc0-5e284076315f@synopsys.com>
 <alpine.DEB.2.21.2003312123530.30236@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003312123530.30236@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: b5219d40-9ddc-4898-24e7-08d7d5bb6812
x-ms-traffictypediagnostic: BYAPR12MB2613:
x-microsoft-antispam-prvs: <BYAPR12MB2613614061097F4F7ED1967DB6C80@BYAPR12MB2613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(39860400002)(396003)(346002)(366004)(136003)(6512007)(186003)(26005)(64756008)(71200400001)(6486002)(76116006)(66476007)(31686004)(66446008)(5660300002)(66946007)(2906002)(66556008)(2616005)(8676002)(6506007)(86362001)(36756003)(81156014)(53546011)(8936002)(4744005)(478600001)(316002)(6916009)(81166006)(31696002)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AN0SST1Hnv0jQeuBeiTsAOLDtd/4vVHiNdrNxxVL4uivyLdlKPibCffYiILgyh87SQvLfaxNIPDQMfrjvJloCnuyQ+PIMXylFTv9JZSkZ9X7+4vqYlpF25vEB3J2Zi4fXRYy8VuqdvVkUBGOPdmbxJ7sX13zvJM5VqGYaELZ2sl1rJtuWYsAIPe2d3u5D+sOIpYTd2zDVmLHKmIAt3pcN/Ovu9zAS2IGgxyMWXTdDFpJHujwz7Yl7dARU9rS7NSJyzFW0xQgdnb61ZPipk+5O/EmRm2wATK0ga8WtB5xRX7sEx8b1WbhkSZthSWYdJDrSX5EUSs8UODdjQP7AhE8l3Q6kHRbj9tj+4dygZYdBGtUfi2l9SM2thdu7h8omXPF4WBrqibraypDT9WsI4tZ9sqYQPl8X1lgUSu5kdWpylhmOLbLKOwuSRKK45663OCz
x-ms-exchange-antispam-messagedata: X4okz6CdAPWpyOsASBQOsWH3mUDmSFDVrG+h8ZtTksQGFuyp9275xUvow4/tUJwucyz3zonHlVXye6bY+BVyy8PfhTSfP9XVLaAH+lWA2OtAEpeaaXIDfzY4OsCj+Sjpzuo7FBP7kQT67B+DT+QAtw==
x-ms-exchange-transport-forked: True
Content-ID: <03F5D92D1B52E64781B5446D327B315D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b5219d40-9ddc-4898-24e7-08d7d5bb6812
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 21:35:17.6665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzDZYC6ipjLiJnozpFfLBQGHeo/OMFhbuAWFY789d6SHDsb5aKFxJVu38CXbvtJM20PlfnWSwhDl1zYW5+eQ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2613
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_143634_207040_BBE619F3 
X-CRM114-Status: GOOD (  11.11  )
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

On 3/31/20 2:27 PM, Joseph Myers wrote:
> On Tue, 31 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> But a BE system can't possibly be mixed with a LE, its not really a 
>> multilib case
>
> Indeed.  The Linux kernel does not support running BE processes on an LE 
> kernel or vice versa, even when the underlying architecture does support 
> runtime changes of endianness.  So all the pieces that are relevant for 
> 32-bit / 64-bit coexistence like that are irrelevant (but each ABI should 
> still have a unique dynamic linker name).

Thx for confirming.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
