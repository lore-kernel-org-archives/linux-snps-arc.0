Return-Path: <SRS0=UT4s=43=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4775AC10F27
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7542146E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 18:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HoTuadbz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jHh8dJFf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="FE1/++g+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7542146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0bKIj4h2USfr41QKsRiIDVIXLS8ATkWl6eEysF5P2M=; b=HoTuadbz8vPx5i
	XyN5vcbP/3QzKsFNybWiACkysRcKWhsX7Q8eTBIvvw7BEW9IPr2ZzMsWnoRDpUJjYI+Qpgz/Teecn
	LnRJ/fb9cqdUMwKkV/OBrUM14qkxDJaCZu4yWqbvkbGgc3C0vkUjH84Byzvr5OQfGPjHbg/iI6/81
	kgGurjtW60QHr5womBiR+6PSqfo59JwPjHK6VnnkA5nruTKY9W3WuNwHo/3VzFes3t3fuFMWHWv/P
	9p5tUJp+J3yPz6ywdrp2Q2H+q+qj8F2YmN32w3vBYy+5AflLZ8x0W/T7xIg0QvnTFVHrQyomDkvbo
	z3tx1VMdjyONR6/m2NjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjIq-0000KW-3I; Tue, 10 Mar 2020 18:08:28 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjIm-0000K3-SR
 for linux-snps-arc@lists.infradead.org; Tue, 10 Mar 2020 18:08:26 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1DA09C0F18;
 Tue, 10 Mar 2020 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583863703; bh=nUn3KdD4mLZ+96zTsnCwgYzJ3GuyUqRnbN9CJBIE0CU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=jHh8dJFfN4SoplufUnWiNenhss/Apn8493hlbkyWVaiUSrH91A+muW0ywSHmk8yUG
 SgynLI+Gn3vXEE3Asahya02uqUJyqmgJUpwp3nWobu84kYrBv+QO0m9eqZgpmCj6bk
 LkpkhErtHQY3aXcuC5vLOOsq1TxG7adXXHwQKUxt08yEyMphWRqEvbpAKmkVbjCsCS
 hG5qmg0maxaPmeJvinBCtWHqIR0mBF2CDvQqEu18uMU8f31/Ed2lHgl8wqdoDq59Ce
 W96d/PKaJuh0FzdjXF5ZqM02BObxk86y4UfhHkesfFATLq7nJhYppFPblqaID43pTJ
 QikJNLVY4ncNg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4DCA2A007A;
 Tue, 10 Mar 2020 18:08:21 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 11:08:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Mar 2020 11:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6ybF7r/28x5xAu5bxFttNvL4wwFaemZlb0lVzd0AY9xjahGvfgZyZdzpyiSKn9Do1Hq2BtmEhSFukilgcOvbWatZt2b7kFf48CpKnPjb4hBTUnLsUlwnCEMEvvikU3Oz18YNJQb7cwokZb4AOC8VPlc82XIzRveLZKqJ0CJOfDT6HmUO3tArftCH3Tp+v1P832ruEDfCojLHTJ/6W5BUefWPjE+gAgkwTLYv9r02FIEdEAM1i1uYuwiMYOzeC4XVP3P06GljlHWL4wUcKPGyeaDPMh/y0JJFJkx+KZKLKZNcOolUU+a+PJ68OqYA1h++3Oq6m0HJjm1IYLb5XInag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUn3KdD4mLZ+96zTsnCwgYzJ3GuyUqRnbN9CJBIE0CU=;
 b=XulkF2z+08mRsmLgF3sRp4mcv+TDYzSZyBoN1W4ASXwdFXE5SXgor1E2GB14UI9O9MEJC8beycS23chaVBsZ9aIpD3MyAeHsNXlcvx7dF8bYYmJQraiGxwecCG6LpS9jPblPuGTIx9Ou14FJL21Uo11NG9yiMeEa7RwjPfcpWxeklvEN9GIhRHk66sxHv9ag9uzdh3pUx1InRKOXWRCUo3NcSdMJ2ezyhPhAKvIn0niRQyCu6Eu3/vddkop7+RGl6ANkfJUw79XSY8wHlqv1VHCwokd8bPCaubx2QUpP1OuNbYIEK7GpoQJjlDcQb4l2PbyIFOvTlWDqvaKVtcFFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUn3KdD4mLZ+96zTsnCwgYzJ3GuyUqRnbN9CJBIE0CU=;
 b=FE1/++g+G53MfytwQMMzgbtXIjsx4XK2yjUKn3AoUThhZo46ottYZaogNwNr98A+57dSPAGeBIujJfHtRgsp6+yBVZ0LC0dZ1sSoxZpwc1F0hmrFIPbvJ6bIfad4ga6MAXRoU5mZMSW7yWENJjCIATo+zkkDrwlInE0wCCCTXGI=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15; Tue, 10 Mar
 2020 18:08:04 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 18:08:04 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Carlos O'Donell <carlos@redhat.com>, Joseph Myers <joseph@codesourcery.com>
Subject: Re: sourceware account access
Thread-Topic: sourceware account access
Thread-Index: AQHV9wbXV7wmxrZ4e0aFOAVgm1lXCA==
Date: Tue, 10 Mar 2020 18:08:04 +0000
Message-ID: <80389f7d-0b24-d735-693b-0afe0ccb116a@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-2-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070012230.26274@digraph.polyomino.org.uk>
 <c44fbf35-1033-455b-55b4-774b9a680e72@synopsys.com>
 <6919df79-8fe0-5d4a-0904-f44c660b697d@synopsys.com>
 <81301ef0-7e97-3404-4b60-d9424566e787@redhat.com>
In-Reply-To: <81301ef0-7e97-3404-4b60-d9424566e787@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aed45145-097a-4eac-0d77-08d7c51dfa65
x-ms-traffictypediagnostic: BYAPR12MB2984:
x-microsoft-antispam-prvs: <BYAPR12MB2984C318063A45778326445CB6FF0@BYAPR12MB2984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(136003)(396003)(346002)(189003)(199004)(81166006)(6506007)(53546011)(86362001)(36756003)(7116003)(8676002)(4326008)(4744005)(2616005)(966005)(31696002)(6486002)(478600001)(81156014)(110136005)(54906003)(66946007)(15650500001)(66446008)(64756008)(66556008)(76116006)(66476007)(3480700007)(5660300002)(6512007)(316002)(8936002)(186003)(71200400001)(31686004)(26005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2984;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1beFIQPwMhIIpiHeu1XfCRHhOVwfQNm3OPWEq+NPmEfpXlkSDuewvH4xpWesCdfApoHZZbLeoy5H95SSyygP+36PyrDZujqCjX3pMkqj0PFOMTFLfYM/h3TvjJmSDWnUCxzJKhCbxeWy485e53b0O4D7RuDNsbxwmbGWxOaUKSa78NpkRwF9wt31QmfwFt7JOzghuvQWGsrkoiW2lg/7eoOWYwRUPaIvKnTD0gltKOqPQAR6XZBTjPMnUHg/gax3dtqjVVnFiaIOSDIvb2+6shdQvagydHcPq9D7Su0NKgSVITEmQwjGO+Ie3xZRTlnStp76jDsHAdKGI7RxDEFkvhA3y3u5StK5DxZj5+Ojlk79ebKit7JIGXdhXWcEyU4mrLnY8DbW4VNRZe0/H8UBj/vQVl2AblY8Q5/fUHaV6UdXf2bQ7/MSL7ZSg+lH2EyNyZ+YDAyoT2Ci87jd6MwVRJt2B3DSxZs6RApFVj9G/XupnzIVICkGRvX6zO0pxW2cn71QppwBdPiIAj0ZL9/jA==
x-ms-exchange-antispam-messagedata: LOgirog8aquLlkt9TrNzfD4lVAVgL0rlGdm8jDRcc3PmeAgBS/pKG/godwSTC2a5BuOvf/e5CHhPAsAZ1rlqO75XOtdoSgvRYRM1wmX03xltIP51aVcZQgV5Rg95qz1RLe6GA0C6FQBJ0dr7i6pzKg==
x-ms-exchange-transport-forked: True
Content-ID: <46A3DB891A4C8D479AA57A9B591A4D00@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aed45145-097a-4eac-0d77-08d7c51dfa65
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 18:08:04.1584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqXlrfVuRdXXiHTiJBflMuPHapTDUpVsWThR7A4NElfbrrUZO5RU8sQ48FTKLK4hCuW97f3u81RdVKQU/nYHDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_110824_988301_34E0252D 
X-CRM114-Status: GOOD (  11.88  )
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

On 3/10/20 10:57 AM, Carlos O'Donell via Libc-alpha wrote:
> Please take a look at the following page:
> 
> "Becoming a maintainer (developer)":
> https://sourceware.org/glibc/wiki/MAINTAINERS#Becoming_a_maintainer_.28developer.29
> ~~~
> 5. Ask for commit access.
> 
>     * Ask one of the project stewards to authorize your commit access.
> 
>     * If the project steward authorizes you for commit access follow these 
>       instructions to create a sourceware account with commit access to the
>       glibc repository. 
> ~~~
> 
> Joseph and I are both stewards.
> "Project stewards (GNU package maintainers)"
> https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29
> 
> I would be happy to authorize your commit access.
> 
> I assume your intent is to be one of the machine maintainers for ARC?

Yeah, this email was my indirect way of asking for commit access :-)
Indeed this is for ARC glibc machine maintainer.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
