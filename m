Return-Path: <SRS0=/JEi=2C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1D8C43603
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2019 23:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA26206B7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Dec 2019 23:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQfB7FmS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bgO0OSmk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="J2jZaRet"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA26206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QBWPu2xMwHxnBDwxA4jGuWjkENEa7yNm8npMpFt+6GU=; b=GQfB7FmSpuzNME
	UzbhvIHiYLkjh76qUbyiLtc594ANCVtGB/OTAIHfViP9HTb+5xh1TV4rqhj+cMGmvZBVqXWUYRdBJ
	bx+otXgHWWWSXkU1V/ltk2v9+BeNseuN0TOVqfedgUIj5areMZJ3V29zdzdaQum7QD3wQCThIZyf3
	m/CdkUedB0lLWJCR35igwSWbpfVYZieJ5Wir4XiQISKtO7zr+PVjfNzOtamsR10UHjmoTYpqSmXAD
	CkW6AtKPYQ/QvKBVDdGzf4vp3q3voIcVwWnuZo2WSm2NHkEZJKd9Phq0ImUsAJZ9RFK0LhrTp10Gb
	A4i+WH0eOvsaGwtiS3OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifYKq-0000Zz-92; Thu, 12 Dec 2019 23:57:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifYIK-0003vD-JO
 for linux-snps-arc@lists.infradead.org; Thu, 12 Dec 2019 23:55:00 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8F50642305;
 Thu, 12 Dec 2019 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576194894; bh=paE7Y5PY3jf5Mch/yW8RkFrbYvqTZIP1vDDmfhdP6VY=;
 h=From:To:CC:Subject:Date:From;
 b=bgO0OSmkDQQxCqQ8op7Po+DI/QuYD4lZ4Q5tbUMZKqTmbTpX7BdvzMatusWxKuloO
 lwvZnM+TS96JnYq6vRGPPOZBwxS54cHKT/yjruyZrb5e4I4alqaBaxqykcNUwFe8CY
 hBOaNTTTVvf4QZo7ptyHfEX7BMgKIKw0i/YK93gvd+xBnp1JPPI3ciKF5JUOCZyjlo
 WRvDjyPlMSXCLh4JaGszPn8JSlNBefRui9s/Ij0Qv2yPqvWzPaKU+DiiUK3QxYKL1q
 M5pnXZE15cBxYHOauzsoL9Q0+6g1EB0M07d90jxa5ih/fEy4SCAiwk/FycToK8qFn0
 OI4HtfEmvkdZQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id BD13DA0083;
 Thu, 12 Dec 2019 23:54:52 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 15:54:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 15:54:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1GP3QFnSJGQpRUWlT2v4BKhwgmOv59jfyzCIdNT3d0qWjKNrFVs7/zNJd4OIAMT/fY7lidzWTXlzFxv2F3BPtCPYsVZIKCEJnG41d2AEDWEUmTA9Eit2LDvtN/hfLQLd2CZ+2ItjqHLFLWBeDdXbvDSzhQwUtsgwuTq2q3GX76h7WwFJ90fEntGWwRzXXFrSFHxBBztAmkh4Zvt/Na5SGOb4m3ZCcSAw+XycKWfik7uqRHKjU54FERurlsJ8FZK+vhcdF2Ld2v4JYtIC2o2aVugQA8ytwUHQlLENc8P10XvdvXjJ5/5EjGZa8It9Ktxwp027seec/g1guLJMJ4mkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paE7Y5PY3jf5Mch/yW8RkFrbYvqTZIP1vDDmfhdP6VY=;
 b=f5kYVwWH9T7uBTESUFZf+QLLpKAveqONKQYMmJPrZATdAZ74qcP6eZrsMxkQcTsPj0KEC7L4j8h3TAchKLnQU14m2kufj5w8Nwdgk9M+L5tmORoQb+nLVjr1Sgr1+lFBYRjA/ObWjkwfhO/kDCZn6j+zwz6aQAdkmYwwRWbK15HPS7uZsoPVHTr/nru2bUQbQpR0Kdwbf47TTtFPjyMXnA1hjpfOGNNBtIbySCxXLJuJK8fhPP0GYKaS0IVamp5qYP4P/4Byj76J4O0myWOQE2lZL/ZYzROoZCnRsxCGob5Q0yDnO0fl9gUD2eNXwnsgwEjh76oL91gx5tOTZ8QNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paE7Y5PY3jf5Mch/yW8RkFrbYvqTZIP1vDDmfhdP6VY=;
 b=J2jZaRetBNGm/sMD9pxDpVNfxYe9zRkP5PkSzKVOAreEk9REKcREgMUPQn1vU35nT6ZRnrpl701Y+qv8zHnn0slpNY00ZlaZZKFjx3fWRzVMc2VXQSmAGt5SzBsSxOK2gNVrZUL2q2n2Bo/KzkQeeRCcYWoReY1lWK46hYje81c=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3493.namprd12.prod.outlook.com (20.178.54.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Thu, 12 Dec 2019 23:54:37 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::19d8:78d:d881:c8ef%5]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 23:54:37 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "devel@uclibc-ng.org" <devel@uclibc-ng.org>,
 "jan.vangorp_ext@softathome.com" <jan.vangorp_ext@softathome.com>
Subject: stdio fudging errno ?
Thread-Topic: stdio fudging errno ?
Thread-Index: AQHVsUeCwLJZNrfuJ060RxlMEGED2A==
Date: Thu, 12 Dec 2019 23:54:36 +0000
Message-ID: <77f8a379-f3dc-6d15-4d8a-20be0346e9f6@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 2091b903-ad02-4740-850d-08d77f5ea52b
x-ms-traffictypediagnostic: BYAPR12MB3493:
x-microsoft-antispam-prvs: <BYAPR12MB3493FE3457DA82A35D1D96DEB6550@BYAPR12MB3493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(6512007)(8676002)(2616005)(8936002)(81166006)(81156014)(6486002)(5660300002)(4326008)(71200400001)(6506007)(76116006)(31696002)(186003)(7116003)(66446008)(26005)(64756008)(66556008)(86362001)(36756003)(31686004)(66946007)(2906002)(110136005)(66476007)(478600001)(316002)(3480700005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3493;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SE7Lbgp20Y30TW1aj8DMalZbveb8AyzhIfTCnnG4BAiTJPH+RsuboLRupNY0x5SU6CTjKUr1NYRf+Lw6a0+w/4BpWVGGKZISqAm+dsFllTCsvYnS4pDrFbDhQA+bGUe1Sqku3cl8bfFUF4h8yVRMTM4G0odQHErRzvdIWns5aGaurORFKf6uKC6Y2RWrHaPvGjVCAxRXan/TPU3JVAdQMIF1yp8U/r5mhonYIh+UcTi0szKwND7i1P02FfmQRCeNBFH358zK0NJhmc1FUfZX/KVOq52dbfA9TavlByVxbWGNtbrebe5PCzFgegT8oOvr17YUa572ujqB3x8/92eY0QRuhdovyyZUSEKAcO+G9uHoCqVcYXCX2iLOeWvMOZYGwHIpxjlKhxMo9bhn/0cRgx5TiOV4Xr5HRUAhB8lQkr6gzBT0oMYLvtAQU3wgf/ac
x-ms-exchange-transport-forked: True
Content-ID: <954F69BBE78CCE4C9E8059C33EE21803@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2091b903-ad02-4740-850d-08d77f5ea52b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 23:54:36.9751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fo1Av/Jt28jZkI1JDpEtW1aD1mcYyDkmKnAIP24ZuOXuDyl49go6cELyoXtsDbPN8CTYPoCh9pO30fTE0SgO+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3493
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_155456_823487_F236127A 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

I've been trying to cleanup uClibc test-suite failures on ARC and when debugging
test-double ran into a totally unrelated issue where it fails as

| testing double (without inline functions)
| Failure: finite (0): errno set to 11, expected 0 (unchanged)

Turns out the test harness uses asprintf() which seems to be fudging errno causing
test harness to erroneously declare failure:


Here's a simple test case which shows the problem:

	#define _GNU_SOURCE
	#include <stdio.h>
	#include <stdlib.h>
	#include <errno.h>

	void main(void)
	{
        	const char *this_func = "finite";
	        char *test_name;

        	errno = 0;
	        if (asprintf (&test_name, "%s (%s)", this_func, "my-str") == -1)
			abort ();

	        printf("%d\n", errno);	// <-- prints 11
	}

The errno unconditionally being set to EAGAIN seems to have been introduced in
commit 568ceebf6adfc58c64a95133311268db6 ("Fix infinite loop when fopencookie
custom write returns 0 on error") bakc in 2016.

+#define __STDIO_STREAM_CUSTOM_WRITE_FUNC(S, ARGS...) \
+ if (__STDIO_STREAM_IS_CUSTOM((S))) { \
+       _IO_cookie_file_t *cfile = (_IO_cookie_file_t *) (S); \
+       if (cfile->__gcs.write == NULL) { \
+               __set_errno(EINVAL); \
+               return -1; \
+       } \
+       __set_errno(EAGAIN); \
+       ssize_t w = cfile->__gcs.write(cfile->__cookie, ##ARGS); \
+       return (w == 0 ? -1 : w); \
+ }


I don't understand all the logic but shouldn't it be set after __gcs.write() call ?

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
