Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23441C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 19:09:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D40207D3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 19:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oGkAsgh/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AokUlQG4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eKGrgtxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D40207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aOfs34ya2AfLvP+qaofmED8FtRalsoD6kv1T2IggZA=; b=oGkAsgh/n2RK1h
	FyoN+BMeMDChG4+a8LRIAO468jZI/+SqUV8fzFDrlM8DbKkVLCrveSyvs3+asRHpuZy9paMgGtpnQ
	xw4ZXG0GDnVGBnqsQMYDQc2ixRtvIETpOW+0BWcqmv3OueNz0+6SMXnQX3/hx+ueR8UXrNfjvijmT
	zxpH9ykldJayGuK3ttYI89mP5ylbGVltXeZy/rjHpKAqcBaf0q5C6R9/ZNyf0ukAHlFUh2ZD554yj
	6wv3wLoPZTslTheU+sGqflg4JVAlytppAq9SQsxndPcovRuyscIKjTJNDAQE/skbGcnOwXF25gcEp
	VxB/G32F9p488se7eNAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkuUV-0003PL-HK; Mon, 15 Jun 2020 19:09:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkuUS-0003Lw-Ls
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 19:09:54 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 47E83404C9;
 Mon, 15 Jun 2020 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592248191; bh=5hsTpJxbNPwN7FY5G+ywyfJILI/x3XoJqku7gsnejCk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=AokUlQG4PSSUyInNHwALR5ZSndhP1g5ObysSXRB6kBt8fuKhANVbG1Y77Qp3Sisae
 S7LPPJFFJ2hbu276Z89U/TsiaLlkLS0/OohmHJi4d2lCvcuPcCBHUN1dFpcWD2Ley7
 kLpUkOiIaDjZYG8IYZ31nnloujaaFEsth6u3Ec1hut0CjZBp78EL6BtYnnI6UIF2sC
 VS7aNSuWpOHiDXNYILz7e08k5KPZhXovaBZA0Vv5CFNqZf1YGFn9vZkUSWYtjjnUqo
 TggcaJVvM1E0Yqmihy6H8mfrkavCack1Uv0/ztyX+PEdqTwaGJZ1wOa3QYFBG5Elzu
 OXRUCaCrrmOcQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C210EA00A0;
 Mon, 15 Jun 2020 19:09:45 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C646A800CC;
 Mon, 15 Jun 2020 19:09:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="eKGrgtxZ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldRwN1IltIbtbOpN2mn+FQpjEAsHwA6mDdzQQNEVmu4z/Wv74+o7IksWjjOWZjTO1nhUdHyZ5EKxuqxo1Gad6G1UJoGSQVI1sB4VPy+DHZ2nNpJEWViwpW4GTg8ljvgqn+zVzgqvMMpoxeVzgaSrjS+DR9zS5tgdTHmT2iycx4QY1f5zNQtN5Df/TyVHx/AxeS9lswRFp2ghy9Nw9dAdalOm4CuS3YSNFWhiAk+m5w9De/MZzfDQ4IOq2a9AHeaRh3DrYCGvkZ6HesplxWUdeRKHjzbrZGkefY3DgGubZnS0whxy5V4jV5W3YesIzD3ta4NkQED0Cu9Wna3vBEtPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hsTpJxbNPwN7FY5G+ywyfJILI/x3XoJqku7gsnejCk=;
 b=XThDLVbOmYyWYFnXD/jfvAG4ZeUmp7AsnHPlk/D2ixxyXJ61s7YiftilRIC+kRqfjyGSxNdQAQ3WYekYFS2kWut4T22I+tTvkw1+z2vVvb1RtfbqJdwLnAwHNbUjyBfRe36kWe1nBfThjJQL1Sc7ZBiPM08Y978O02cpCvaKp3NmiYLKvKneI6RXLNPeD0x+M5o7SwDPbSlmwKNUcx8aTNAuCvXAB54JnkczxgXeSVFYqQ/100o6xerWLEBqBsuui8Wl/4X0D8Cy5kRqb685EkawEXQEeMLEGd3l69ugxjV1vzutZ3uqME/gNWJIo8yulTbOyJA2OGKFZ3R7GbAD0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hsTpJxbNPwN7FY5G+ywyfJILI/x3XoJqku7gsnejCk=;
 b=eKGrgtxZBKySuZc+Qiynudxm2IdKH8vPmEEiJuY/hG25sioOC0ZPqvb1jSfn5XppEdNMKGvlXxEuURLmOqSilcwqHc9j5urR//sDTvBzF6G8y/Cq0rl2dU/Gnbx3L2IJ5Da2gr1xMERiIiC3LZ96sTlM7HjWPIh2srkELZqbo54=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Mon, 15 Jun
 2020 19:09:41 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 19:09:41 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Topic: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Index: AQHWQ0iFvsR6QMu+Xkalpg/pKYNaTg==
Date: Mon, 15 Jun 2020 19:09:41 +0000
Message-ID: <6d22b849-e27d-9843-90e3-7ea635c6d863@synopsys.com>
References: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
 <20200602023223.13823-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
 <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
 <115b2236-e994-cdfd-d96e-2e8d354b7fde@synopsys.com>
In-Reply-To: <115b2236-e994-cdfd-d96e-2e8d354b7fde@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: sourceware.org; dkim=none (message not signed)
 header.d=none;sourceware.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5f56ceb-49f5-4d66-7c1b-08d8115fa861
x-ms-traffictypediagnostic: BYAPR12MB3399:
x-microsoft-antispam-prvs: <BYAPR12MB3399299435CCE1D1E79A193AB69C0@BYAPR12MB3399.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jw9ONTnRZKweIXc1OuZ/X+/n2nziI7UmrXg89/wf6L6FHpEJtiLpNe3DicVXiq6uErK5QAb0sjioPXw8VepImmHJU96X+LohPsdQWK6SrACki3f0DV/P1ZdWeTXdoNrbGvVBSbJncNlgptJVeut+rM1UxK+ij8oWlHTL8i2reRm6EGLRA4rCPhnw4tCFbGHbVhQdN+jExT+FD30CqnnBG3y2INAZ/HlM1oK3oBkbtKUUrqrFxsny7RSvZsq2h2at11g0URqs8PQ8JxEYK2HFdcglk0fLPc48B5cqHwDIRyF4Z9aExn+k7SW4WCqD6itQComGhtTaT2BLukcTCLLDI1/J1yUUAvDaSGIhztPaoKzoegGsBtiqzK3+UBXRjMQn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(366004)(346002)(396003)(39860400002)(478600001)(54906003)(6512007)(71200400001)(26005)(31696002)(86362001)(2906002)(8936002)(6486002)(66476007)(64756008)(66946007)(66446008)(66556008)(76116006)(36756003)(316002)(186003)(31686004)(8676002)(53546011)(2616005)(4326008)(5660300002)(6916009)(6506007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XXeXDD1LI+VJtwpBwJWn5OZ0NvHOBum6d7cs3StmfDoWi2WsN38qAMH4QJfGUI4pei46f5wtWXqWxukSBXh6p5ty7JRa2BmcXeCYtUlpRcl51cPAPEaTrZifNgjhzDLqGiDswuSHkMnRFE2+nDfgt5r0Sy+Q9mEzbzZYavda0JufG3hZ9OL/rhpu0uEir6cSq3Bewk61JDW5rFbNkkQH/zHqFEVPzLfGaIsqOcGsmje2uHb/2rNtgQcgYc2Ixx69svLjguwhCNDvktO56hpSieVWPz1JbJwCLunGiKCywoQRWaf3NCwpxh4z6HLKWB/h44C+McXA4QomTA9EVqm1sdLiV1+mioJJwMmgApPbTtpmRScUKPyYjBrxXPneA+r0m3NJmy+JFf4Yg6S2JH79EWidxO198xii08qlEkJez9UEYn+8ihoU4lrDriMPivS/4IMn/QkqVyA2zMSB65oSFTzH8y8YHs6iHPVHaK+H3Gk=
x-ms-exchange-transport-forked: True
Content-ID: <A706A89825155C41BF10E490BB678AE1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f56ceb-49f5-4d66-7c1b-08d8115fa861
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 19:09:41.6472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IaOPihYzZ11I6Zg+Mfk1O6xDxv0OG/nJCC0ynOQSEs+qmA79PNfohGHenTsHPGfRpCe0o1HbGJq5bzk6pI7d7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_120952_788934_C5DDEE94 
X-CRM114-Status: GOOD (  11.58  )
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
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/4/20 12:08 PM, Vineet Gupta via Libc-alpha wrote:
> On 6/2/20 1:31 PM, Vineet Gupta via Libc-alpha wrote:
>> On 6/2/20 11:16 AM, Joseph Myers wrote:
>>> On Mon, 1 Jun 2020, Vineet Gupta via Libc-alpha wrote:
>>>
>>>> Also as suggested by Joseph [1] used --strip and compared the libs with
>>>> and w/o patch and their sizes are exactly same (with gcc 9).
>>>
>>> My suggestion was to compare the *contents* of the libraries, not just 
>>> their sizes.  Either they should be byte-for-byte identical, or if there 
>>> are other differences (register allocation, line numbers in assertions, 
>>> etc.) a more detailed investigation will be needed.
>>>
>>
>> Here's my diff of the 2 --strip builds
>>
>> for i in `find . -name libm-2.31.9000.so`; do echo $i; diff $i
>> /SCRATCH/vgupta/gnu2/install/glibcs/$i ; echo $?; done
>>
>> ./aarch64-linux-gnu/lib64/libm-2.31.9000.so
>> 0
>> ./arm-linux-gnueabi/lib/libm-2.31.9000.so
>> 0
>> ./x86_64-linux-gnu/lib64/libm-2.31.9000.so
>> 0
>> ./arm-linux-gnueabihf/lib/libm-2.31.9000.so
>> 0
>> ./riscv64-linux-gnu-rv64imac-lp64/lib64/lp64/libm-2.31.9000.so
>> 0
>> ./riscv64-linux-gnu-rv64imafdc-lp64/lib64/lp64/libm-2.31.9000.so
>> 0
>> ./powerpc-linux-gnu/lib/libm-2.31.9000.so
>> 0
>> ./microblaze-linux-gnu/lib/libm-2.31.9000.so
>> 0
>> ./nios2-linux-gnu/lib/libm-2.31.9000.so
>> 0
>> ./hppa-linux-gnu/lib/libm-2.31.9000.so
>> 0
>> ./s390x-linux-gnu/lib64/libm-2.31.9000.so
>> 0
> 
> Is this sufficient for comparison ?

ping !
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
