Return-Path: <SRS0=QvW+=6T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85E2C47247
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 May 2020 17:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C802075E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 May 2020 17:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzXxFVrN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HBRx4yN3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p9JFsrHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C802075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6nMsBSThNSt28h5APWnDtaY0aXxbsXwR8RyXNlntKk=; b=hzXxFVrNwxV18X
	125R3ZAyJcZ4IkJEiGMPb8oJpgvdV7LUooQVsaIiwu2dfTmmIDhPWQ3pmt3v2VMv7C9qCyjosGAO/
	BAcay5B4QrheJ92/0ZNfmALvPmYn0vSBKJpSYWrYXqBIw9ZdxA+wAjKZ7Azz/hB/4covecpzqtOSo
	0cNu2NPvWCY3qp6CuE4XcLO7WFY4UXXnWc1UPNXfY86VIYO5JvKsREx5RZDVdiVj7viC+d1ZRXIis
	XgnHrqwWuMVnic85lHLgtFhOjOhhnafvrj/Pqt9idIdFgHTsW4YlMggQFTrPGayP6ixEK93dXm4es
	kLfWBiXCmh5I5TvrTcBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW1M8-0000CG-83; Tue, 05 May 2020 17:27:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW1M3-0000Ah-V0; Tue, 05 May 2020 17:27:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A0B6402D1;
 Tue,  5 May 2020 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1588699658; bh=6boyoRIPruqzMdieBNDrQx1foBlxKWOkv9dudHHsTwM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HBRx4yN3646ilfx9ArFoDOBshzDhAjYIVbV/OY/RoUWfNyX92kLYLPFWBFunuep/r
 18l5Bs/Q2wpg/p7eJU8nSNpgNfiCEBlW1AyOdfoXyo9ZoUiQUC4aamjlfLUswSIiwE
 //xyKisieXnpaJUASTb+aVrzhxuZBF4y0F2rKD79Ree9qhL4SrzRbHK6hpyoZrttlJ
 1iWNn38z6CR4zSkUUowIfcTt1Ibjh7C1a8hWRf0H9JWs8eKnwcD7KP0AOB87JmwizW
 t7+iFv5sIY2pwtFXFiidI7BfHt5LlJqyaWA56tyS8mBAWODu2wtWdzM3zE6Bj8x7Iz
 xe7ijDl976aaA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6C17EA0079;
 Tue,  5 May 2020 17:27:18 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 May 2020 10:27:18 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 5 May 2020 10:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0Yt6etV0jRHwWvDL+cKp0WDbQJ1JO8e25ynTXt+ElqRfhFJlRfdD0vstqxCthSIM5uUY7J+9YP5td8ulrpRBIKSV5y26dysVJJwT8GVtGjVN7ey1X3n7DI3QtCDJXz6/+Ab/1me0vp192D+ABP3kHwT4NNXazEl1y1AoRU8cFIMMOsiboaKdOLFUMMoxRP54+WqDMh/ytP6Smu6ZE0S9Iha5GmD3hnPQwPD9UqF40T0Ui+tZVogh/dNUNU24GPLXiBroIT3AR1msrGUG6FHVdNyAB1THl9Nf7Zs+UH7Vyq/Ki9HQQfKGKef06Y6epiAta+Ua/Ava8h6Qjc5ZSBdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6boyoRIPruqzMdieBNDrQx1foBlxKWOkv9dudHHsTwM=;
 b=OK9P4eOUoqndm8zrurOCmVimHxuc7n4XCsGae8wbLDmpXTMXvZ9FSzXcxdb0ReDVVrFtMA9u/Zw90K/cIsSYVI0fAwuAs+yLmP3duwxqsKw56OX+bHxU0qbE7k15/jRUkVEMCwmOX4wvWXQTbo/3cHjtRzuXSiQEMq76BpRJMPfdC7j0x72UjHwyWCWMO5Nz/RCXKkDykQTSnfzUAeK5V04VqC/urOv9NvaDA5Ji4xqKBpWkyjEEdrcbJAYXUxrAJEhFEt3j5fa4Yi1xL+flRIDgiljXWAhXxZ8JtVVkFmQgDZEWbXWTb8Zd9CgkTa0Rxmxt5V9CTZnQ+DJb32534w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6boyoRIPruqzMdieBNDrQx1foBlxKWOkv9dudHHsTwM=;
 b=p9JFsrHvuNuadXetUTaD+aqpN2G5MzQu1dbr44f8T2fTJ6iLj3fMZvRa79X4Fq7eR/V1v1OEzHwETeVwzl8vwXG8C1C3s2JUgFWRV6snln2MOqDv529SoNaycQPY+jHQLiC0USU2zIk+aI/o2HlbK4TF8V8AzQ0j2v8wXAxDUWI=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3111.namprd12.prod.outlook.com (2603:10b6:a03:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Tue, 5 May
 2020 17:27:17 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 17:27:17 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Guenter Roeck <linux@roeck-us.net>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Thread-Topic: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Thread-Index: AQHWHiAFM1CeaVL9XUmgz0SxoJ1XgqiWp/EAgAARJQCAAV7ugIABavuAgABFl4A=
Date: Tue, 5 May 2020 17:27:16 +0000
Message-ID: <51b468f8-c05b-a019-f473-429622083045@synopsys.com>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net> <20200503184300.GA154219@roeck-us.net>
 <20200504153901.GM14260@kernel.org>
 <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
In-Reply-To: <ca099c3e-c0bc-cd2f-cdb0-852dfc2c10db@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 182c20dc-a1a1-47c5-403e-08d7f1198efd
x-ms-traffictypediagnostic: BYAPR12MB3111:
x-microsoft-antispam-prvs: <BYAPR12MB31114F85832DC9F5C66674F4B6A70@BYAPR12MB3111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBWSFp3WcyoxOR980JbG7R8KdjMJMl1y3GXYDAJCt8RJqreckiOMvbqo0SM5IYkC+TLw7Y6NjsfnXCL0nCEb5setZqmAzIYbJW6+lvZAXJxWUaK2/Q47eZQ5obst/hq8ZWg9zx5NIdZ7W6CEIvdpU6m0kpyhY88dvgVI2ZLbh56U1AJZ1X1v7pNOKFRuMAfgEAApkQnPon7HkgFTGAQT/TA/RSO2YoeUvmJmvuFbFI98jXzRvbIJS74wbtbbG60y3ey9UMpo9miu6oUlyvPWlK3nhqmGYe8gWU4zSUytgLUMFdFznIx3HkdvTy3iHsUr40L2fLJ2pNH1eljyU1s7zXmM57A3OzlEMKfNneo06EHCrQsye9hnYRnOPiNfvJZNHRkl0eU38pM8FrAUZ46ykp7QbYZ7DVJBrGNeG0H/pPWfx3qSVODocMxgKxNiqdU2C1shzJTt0BRZkG6oe9y+K60Xnl7j7Ese9qTe+U8DLsNXuSRtWxBpNyY/kCIJ2LFyb9Txvwfo6fYRe09TMuYZEFGmFpuwPvibWMrn8vH/iJprtbITZ18CGvWKAolMYUgP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(33430700001)(6486002)(186003)(31696002)(478600001)(36756003)(5660300002)(33440700001)(6506007)(86362001)(2616005)(53546011)(7406005)(54906003)(110136005)(2906002)(8936002)(7366002)(7416002)(71200400001)(4326008)(6512007)(8676002)(66946007)(31686004)(316002)(64756008)(66476007)(66556008)(66446008)(76116006)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CMhlvVLP+cglrqi5u7edG/4dU/HCzfZIPPzt5g42qWWGbfJsRgS7OzBTmPYlh7LKaS7eDYruN21f+yR9fs1WhYtLbOfbn7TnTmrsIyhW53vfcRWLImpC6Lz58cqDlaD83xNz8d/rQkpw4NZp0pOQ+KUt8GjMSKJH1vAPGOcLx24it0/AS7fcmu56GrOmxqDYyFqOk8prbnmsFPhb1KPsl8luAqwdGUfG6IlpuUY9dnrJqROBb/eQHnhjqaxLkzqSaxg3mwQBLHoFhJEQSivTq+RtXk9pOx/1TkYelof7De0n3GGjDa69guKZ8L3lTcBLtJRqvCURgYGAJWAao+B8Ks6Xoi/TLe5zX/sAlUuX+nZN0XMPLDL5gLDTw8jk/gs30wsSn/JFqJRRDJV06ajSG9BbvfecRjReXehW6I0vjL4UfLOZmVpsBi4HJacWi1+Rrt6//PWKexytwWb0mJCwfnELA0nas4teKByfPg/qhuR/6sYu8UZK/TgZRmAuRw6tMioQpVs9CDEgSGduGibL0ONZFjI5v/vM+n9kG5kAgHahRY/LK6CEYW46F7QycLFK6856E9k1Q+AhkKhJ0Ek7ikggb4/JqZYGs35DTw3qrXVQT1W+pWCGt8p7NDuwxQPA6sHkNdGm3gNOu0l9EmHHXzdt4NJppGPXBqFQaHnrT2C82/HN1Rn6lx6Nwwmj6E5DTiTreZY1etEWe7wN4iPozynl0QvWvEG/r3A5xvt2EQEqWkEB8ILJ3STxF7TRpaeZCyJjy1c58eHzIx61PdLpFGTJIhqTnGGAcL19fK/XSVdXy+YH205GuyaPc2z3t7CHaJkHIEblJY35rimOXymvtIR85oe95EWgGh96Gswesdg=
x-ms-exchange-transport-forked: True
Content-ID: <71155D187A337740904D5836ABF4A094@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c20dc-a1a1-47c5-403e-08d7f1198efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 17:27:16.6825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4u22c2Mj9VEU4LlLhv0m8STcbjUlVhLCQLh2dPO6aK13u1R4Y7LqNMlPib9qBi1cBmNiKKjJQ4oGiUYL/6EXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3111
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_102740_013389_BC33E5FF 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, "x86@kernel.org" <x86@kernel.org>,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Greg
 Ungerer <gerg@linux-m68k.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "uclinux-h8-devel@lists.sourceforge.jp"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Nick Hu <nickhu@andestech.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Brian
 Cain <bcain@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/5/20 6:18 AM, Guenter Roeck wrote:
> On 5/4/20 8:39 AM, Mike Rapoport wrote:
>> On Sun, May 03, 2020 at 11:43:00AM -0700, Guenter Roeck wrote:
>>> On Sun, May 03, 2020 at 10:41:38AM -0700, Guenter Roeck wrote:
>>>> Hi,
>>>>
>>>> On Wed, Apr 29, 2020 at 03:11:23PM +0300, Mike Rapoport wrote:
>>>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>>>
>>>>> Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
>>>>> ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
>>>>> sorted in descending order allows using free_area_init() on such
>>>>> architectures.
>>>>>
>>>>> Add top -> down traversal of max_zone_pfn array in free_area_init() and use
>>>>> the latter in ARC node/zone initialization.
>>>>>
>>>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>>>> This patch causes my microblazeel qemu boot test in linux-next to fail.
>>>> Reverting it fixes the problem.
>>>>
>>> The same problem is seen with s390 emulations.
>> Yeah, this patch breaks some others as well :(
>>
>> My assumption that max_zone_pfn defines architectural limit for maximal
>> PFN that can belong to a zone was over-optimistic. Several arches
>> actually do that, but others do
>>
>> 	max_zone_pfn[ZONE_DMA] = MAX_DMA_PFN;
>> 	max_zone_pfn[ZONE_NORMAL] = max_pfn;
>>
>> where MAX_DMA_PFN is build-time constrain and max_pfn is run time limit
>> for the current system.
>>
>> So, when max_pfn is lower than MAX_DMA_PFN, the free_init_area() will
>> consider max_zone_pfn as descending and will wrongly calculate zone
>> extents.
>>
>> That said, instead of trying to create a generic way to special case
>> ARC, I suggest to simply use the below patch instead.
>>
> As a reminder, I reported the problem against s390 and microblazeel
> (interestingly enough, microblaze (big endian) works), not against arc.

Understood and my comment was to point to any other problems in future.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
