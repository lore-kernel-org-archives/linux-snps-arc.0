Return-Path: <SRS0=d2VE=AA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06B2C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Jun 2020 23:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 874452242E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Jun 2020 23:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBFClSXy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LBYBvgC1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EK3xOnRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 874452242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2eXg77rfWnF+fSDnqyetJg9k1pw1A7Q1Qq3vUdZhTg=; b=fBFClSXyDIdxjV
	TCQOReZDsPsgPZwmiao+7d8xTwWD7Ji1iTgjv38uw2YCCGwcDSxWiz6hcGJusf7kevUvXQHHtwAin
	LIeMl9rYaWuBsB07498IoFpXVu/k91MjOe1Ihb6V6q83NYR2WB0cZ85aBRAW7y9/2TfeLxIF3sfpu
	7ExluhHk1N/et0RHMgnKvl32jNcn3kmiTaVvToBJG70oJT2yy4Lx7yqDyAZzr5elwRWx0+izQZB3i
	/4o+65Jn5ROehVgwtUf5skJ8Bej4IRuhJbWXyNjkoLAeDq+nQnn458EBmbmD9tJPdUnDIW6MQQ6AJ
	6qA+UntocYaLl0F/L90Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmQJH-0006xH-DH; Fri, 19 Jun 2020 23:20:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmQJE-0006wm-FS
 for linux-snps-arc@lists.infradead.org; Fri, 19 Jun 2020 23:20:33 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3EA0940181;
 Fri, 19 Jun 2020 23:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592608829; bh=cceXzJNURmckAkLvHbWH+NT7rcqkGgv63Aw+yhi7kGM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=LBYBvgC1EaPuIql+NZtnINwemlvLqWJKfexHcMTcNr//xewxb/TQE3sTn9qWvuF7N
 WeZdHvUvQBlF69LiPytDsyIA1fQ/eJyfDZflNAzrgtETQ5KYEdzJgeiPaCjI5f5FgX
 t5ePdHexBX41M8N79mkOG2vFuBwlDYRwVEqtWDu6Wemtuv99xUxQJoh2xt8R+Lgk/7
 06KxnhFhmW1G7or+NzOrjGm/xwr5anluWIvUtNtgmNMf+sHcC3uiNNmPKIuWcGoyng
 HAooRscRxUb25jObY9Z3env64Q7XMc+IeGYHxDCktA6uufRPmxlhadBl43H0Y8olaa
 lzHfEe0xApNIA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D79E2A0283;
 Fri, 19 Jun 2020 23:20:21 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EE8F340032;
 Fri, 19 Jun 2020 23:20:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EK3xOnRE";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpK8dODijC820OsVbXHuzsoyzVKDTXYKUSWK/wiVuEff9EObGSu678IitAnldZ4GqWzLFdxbRMzPEnu/FOQmJQyqGiGRp+9TtuJArs+9BjoZWMS/NvqfTu8NUoh4kzXOzqUVMH3vadiYXUrQmY3TfzwoVBKtgY6SbL/CilP8KHK1Eu5FtvqLcGlxas83poAQxr18WlTvQhk0Xy25XbNdBGF8m5+p/RvKuDemyEOJC/ScvNDTa4XorzOV9+9PoIhMuPhwkz2pntEus1VR68OSfmOUGYJ/gn6Qg3wmJWtAGGuh5XKSFFOG7aBQNt5gs5pcMelN/7jWSUsccF5t7rVc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cceXzJNURmckAkLvHbWH+NT7rcqkGgv63Aw+yhi7kGM=;
 b=VK7ra/U5JkZTbt4jvvOoM16i2omXMvS8i3zGQezOiunN7r+1evaWKjolmTlYgsBtS/2yZ1XJmS+b93uufOOAFxkRL1gJfZ36jpQg+1NZX16u2k9qinGnMbPdhahTpjO00uAa4/ZmJJWb3xpm911g0Iz0zkyPcwl9UQwO2/tH2DD4Hwm7iV9FgwoLg0B4XMBPiTLoms/UHHOn0xGKvms5HEvUbbzR8su5R0K8Pc+k4I/DSmYjjQqib8GNLYAiUsrzh9q73x9/XHL9Fvwofqm4jp/CGL5O4nudGqAwkPLFNCTuNsXtn8CynnAcPXAlt4h4xtn+99rjnnkgCd7fhNXFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cceXzJNURmckAkLvHbWH+NT7rcqkGgv63Aw+yhi7kGM=;
 b=EK3xOnREJAy77smFB30ySYHcCACyryO9aJavh87hUUNDMXaV9NOP/U8+V1I7FzKR55xunjTBcKj1tLEw1WgjtK+pgHAbtJ+KexSKzU0SOHy3L348d18XoacKbauoUuC/k9bmmiqcybtjohSTQE83PudliVlPAx5KSR9k00hpoa0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 23:20:08 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 23:20:08 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] Remove STATFS_IS_STATFS64 conditional as it is zero in
 all ports
Thread-Topic: [PATCH] Remove STATFS_IS_STATFS64 conditional as it is zero in
 all ports
Thread-Index: AQHV5sQbYhk7JqHvDUiSP3BCs7sTsKgiNlRVgL8ceQA=
Date: Fri, 19 Jun 2020 23:20:07 +0000
Message-ID: <f8d7b7d1-a1d4-966b-284e-652172652e17@synopsys.com>
References: <20200219012921.5075-1-vgupta@synopsys.com>
 <mvmeeur5597.fsf@suse.de>
In-Reply-To: <mvmeeur5597.fsf@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c31976d-54a4-4fd4-096a-08d814a74e6f
x-ms-traffictypediagnostic: BY5PR12MB4178:
x-microsoft-antispam-prvs: <BY5PR12MB41783E6846C2C0EA7BFBA68DB6980@BY5PR12MB4178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YqFuqmlnoK1VvrOUpSo2J21x7SGDa0lPCr4RW8N/0+KSeA1dZ3RZPSHQx55T05U8KT7XOLISxIJ5mCmQb5iObRlDIbWFb2WXGDWdhNDHvg9gmHRVnJLJ7Y/cW9ncUODD9Xijj+rIewLvr5JFzippzuxt+1S5eyAuyKc2MQmyrh8/Z0KqfrQcOSv777QlNsdXMcmqgCppmdj6CttQwVB1l+1dTO4EBfxg+7Dv/WVSwapd5rLqNC4IF+l4oswieLJd0rp+cybXxxTlrQpzltGx1IVo7YgK/kRxJI7/gh1jazYbQbAcWQHOsRqHQdSGPGzL3HXieNyg5oZ0y5vd4y/MpGGOtsqA3X6WT5bUMAe8ckd8Q4IMjGIO7aFOd6pIOGKM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(39860400002)(136003)(396003)(366004)(6512007)(2906002)(6486002)(26005)(478600001)(5660300002)(53546011)(6506007)(4326008)(31696002)(6916009)(54906003)(71200400001)(8936002)(86362001)(31686004)(316002)(2616005)(186003)(76116006)(66556008)(66476007)(66946007)(64756008)(66446008)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: y7AjHEmXaNwTJaqympi/RY9s1LWmCm+XhVSRu36Q5DEylSPso+kWC2EX2WQhK25mB2nmnXEJB06dk4J5g2Su164tVCHNv3DVZJ/ZhywU5kRIfNCt2QKQGwagrHIkDTYbAGKAtmdiwWlg3rTaDyclBSzQR/wk9Kz2aTIEmt7J28JvHrhpPxRgSmFQjrBcK/I53qYIhiMg/6B8kJ9HIiNZ3kyRjPwFGDAXNsByUiRA0/k3lynTKFgTYVVSOWMrH3x+5raEyg/7QuVH2TaCZZ2OPF4yI47uchWLjfGKXz18wX26lGfNtUs8DXrQJTJI18j/6CiENf/KP6UEJHxg/1HrubLA6Hzqa6rLft9YqNqOR+jpFyPi5akAAAxcMRG8ZjzJbAQn4q2dfio0nEcydhYBp06nadwqJs2gQra61EPxH0SE5jidVmLVJGUX4IDC+MomwYriHOcQ3ueWEVra8GFkD7Z0YOSo22sUMUU0n6MNLgQ=
x-ms-exchange-transport-forked: True
Content-ID: <2B3A9415CFEBA842881822A6AFC21CDF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c31976d-54a4-4fd4-096a-08d814a74e6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 23:20:07.9749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrejrHS5RoIB4aDSx1WebDQJV8Yd54RQsZ3iVaxxiV76W1dbv7YyEv5UTSr1/hfUQCmolTzOl9czQK+ph7NqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_162032_584281_8DBD1060 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Steve Ellcey <sellcey@caviumnetworks.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/19/20 12:51 AM, Andreas Schwab wrote:
> I think STATFS_IS_STATFS64 should actually be set to 1 on all 64-bit
> architectures execpt alpha?

So I experimented with making it 1 on a few 64-bit arches (s390x, powerpc64) but
don't see any cogen changes compared to master for those 2 atleast.

---------->8-----------
diff --git a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
index 2eed3596c0ed..0587e142cf6e 100644
--- a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
@@ -23,8 +23,9 @@
 /* We provide separate 32-bit API versions that check for EOVERFLOW. */
 #if __WORDSIZE == 64
 # define XSTAT_IS_XSTAT64 1
+#define STATFS_IS_STATFS64 1
 #else
 # define XSTAT_IS_XSTAT64 0
+#define STATFS_IS_STATFS64 0
 #endif

diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
index 5c10da3356f2..dd970ba69a7c 100644
--- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
@@ -18,4 +18,4 @@

 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
+#define STATFS_IS_STATFS64 1

diff --git a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
index b38bf741d37b..ac580001f01b 100644
--- a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
@@ -18,4 +18,4 @@

 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
+#define STATFS_IS_STATFS64 1
---------->8-----------

And at any rate, no architecture for any ABI defines it to 1 today, it all seems
dead code to me.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
