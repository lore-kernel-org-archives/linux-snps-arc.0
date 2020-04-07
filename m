Return-Path: <SRS0=cI6t=5X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F075C2BA80
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Apr 2020 16:22:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D8920730
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Apr 2020 16:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qE/g3cD4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BtGuCGO6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cuW+jGEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D8920730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/SNAApsZsrFlB7sLfb9VljZWAIXw8EdOl9yfOQUyJ4=; b=qE/g3cD4eIH5Zr
	eV9PxF7EJ93wUVf1ycxixU2NJJktA8Ca3lH81LuMUsNS6N9/hX9h0dpAmHOFnPrraqHAam56QXKuV
	z5L+myzmgUOZRITyAzOcXezPny63y8pogIgcaNSaUJwlfIIb3d7B1yUQs5zvSiIoeczB4FRGR1mT0
	Tr9Q46Ou/9HH+/wX9lPmnBmS4aD290aByCYvPe7E0MwA2Smd4JT5beH3kXSyjAOTXOdny+0c+hN3U
	qTlDswom2O+oXYBIQy5Q+GKpjTrrua/K8MPzTncCS7r5l7XXnCh/EmaLYvL90ePq0icOb5NKf6J1Z
	DZdIPYiyUxwPycBZwQ3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLqzV-0003wV-Vx; Tue, 07 Apr 2020 16:22:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLqzT-0003t7-8T
 for linux-snps-arc@lists.infradead.org; Tue, 07 Apr 2020 16:22:20 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1867840604;
 Tue,  7 Apr 2020 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586276538; bh=WXgF5LstOd2OXgQt/n41PX1n2fYADHbLw0eshPSjRJQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BtGuCGO6dQAcjmShUrEv9AMqMeYZ0k3/qPmwk5/vmRGa3z+VdNfQ8z71sBIrtoblW
 5NqdQsuZOzFxQQR4O9x0tDnUlQrucXYp8oVcpSMEBymVF8l1YhIq2dPb+OvFmomxoD
 O9dfLE6BZR97hIYnhaJuAm/kk/ez1vNX87MRTdU4u18RUDo9nsw85+u5mW832feVVM
 Vywi70ns9IGara6DcjOVsr0YsCBaaq+JPUGsDHJWsPdv9vPZ/4T3dspUKZq6O2/9Sd
 0utp/4rWPB/z67tyyslJVgbdTFcysgViO4rqdocxmbBqKaCMZ1MVD5em29vzUXUW4B
 3t90fAcet9dAg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5B288A0079;
 Tue,  7 Apr 2020 16:22:12 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 7 Apr 2020 09:22:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 7 Apr 2020 09:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ektuM6eX9GEDtNzXVVRhQSCkIqLBzHIvjCnuTSBbfsh3xeSbOKy2BML87ykzs5NxfsNN/0QFG4ZmL4D/4ADWtH5CwDNOG/bILaD+v7BcaGqQUp9XbBcOA4hIglsxeNJxkBiBUrJ3JXe+NPUeLGH3hqWfIx2IXmroHWEa2Ru7Dc3Y6heBYfRiysGfFVcOHkww+5IQlrsJVmMAZtdYdBajcZJx8G1Xwfm0nqtXHIUWpA2AVI6VYJhKV1LVdS02OLC9SO7LiLWXqqU3Jqo0AgEaPCiaX/jMnhxWbIUbnVvhNxhtQli6K2To4LJhKaaZ5OQ87AL8X5kzw2O3Xka9K1PScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXgF5LstOd2OXgQt/n41PX1n2fYADHbLw0eshPSjRJQ=;
 b=X8XaJT10SiLn45ZUQxrD1V1KIy0dYc4WfzFbHhLS77gnOYX5g/ONE0pPAjbZ1Pn8KwMwqGRfbz/LlzWMmu00/n8DGJrHPtpg4hqXt7m8yl1ndSMpYzJ1ql6XcgUbEKZfE8Qn4rLwMY12OIbCmzK4FG7tYrt3rOfMao6nEoY0AVIaHshsrIGaCY1E3DO7h0hMXIoH1+LD7Ld5GecT4rv8X/wf4X2BPyPIkvzNYWsd0q9Inxo8rrer0ONVDGSYnk0spFpof9rw/j2vs2qHwr67IIbbqvbf/THl/MYBW0GTnjuAhPOa5PEMzv/trpP11wJFAe0myq66iVMhryeEZemoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXgF5LstOd2OXgQt/n41PX1n2fYADHbLw0eshPSjRJQ=;
 b=cuW+jGEn4wNAaRC6YxZqJCCdtgcLHRhKsBYRsTg5IRDWCDz7NWe/ZnUlDrVPoN0O1gFp7lkHJdEP19JfL5QFD6rLrmCb88fui5IVnB9YlV06tTs7xA31Vv/I3H4qT24QnX8re9BkMDMVU5OdEokwiK/6kUpSUhCUFgRbCXVPxSU=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB2548.namprd12.prod.outlook.com
 (2603:10b6:903:d8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Tue, 7 Apr
 2020 16:22:10 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09%8]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 16:22:10 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] ARC: [plat-hsdk]: fix USB regression
Thread-Topic: [PATCH] ARC: [plat-hsdk]: fix USB regression
Thread-Index: AQHWDPhxaWJPAqd1VUOciALGMBfeiqht1wqS
Date: Tue, 7 Apr 2020 16:22:10 +0000
Message-ID: <CY4PR1201MB01366A09C22161ED4B30CE17DEC30@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <20200407161933.10874-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200407161933.10874-1-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2ed4890-2d92-49ee-5074-08d7db0fd2ce
x-ms-traffictypediagnostic: CY4PR1201MB2548:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB254863ACD8A6781AB56F09EADEC30@CY4PR1201MB2548.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(346002)(39860400002)(376002)(366004)(136003)(71200400001)(26005)(186003)(8676002)(86362001)(8936002)(33656002)(478600001)(81166006)(81156014)(2906002)(76116006)(6506007)(4326008)(64756008)(66946007)(66446008)(91956017)(55016002)(66556008)(5660300002)(316002)(52536014)(107886003)(7696005)(54906003)(9686003)(66476007)(53546011)(6916009);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0kL2s3s+SUp4igDhmLEzIlixfkRqIoDjYFQnVW4kz29CjrwQd0NE0F/UGOTrbbKxgeh+VVO5tE9vqTaEulX8CeLwh/tFJ+XwfK5VexThWdWdQpXUlo2Jqh/Vs1NxpmFSZYJOncSDR82a8Ma/tQSz2uymm4pnewwRR+tS2KFBaHGHtv7C+nw2lkWyvyFmEu30g+ORxbAbp4FdrBE9dPUJqApKatIFtEL0nBu15Ksae3XhGzjYrLykUTCOX191ahpEonjkaUO9+fctC+uKJbjXoTR/H8698ceH7Fu7n/TWafdat+DtMBmGV7O9lgFlO5ShxxPlxplujQlqX7SAEk5mta0hr0VqudPIiWIUpOYtL9PQJMvfzZDv+jfanWoNTFOaiEcWRjXR3EbXy+tCZKQ3Jod24SaqCQkPueB3PHjAJKwfffNr2FBUEv1LwGjIQp6m
x-ms-exchange-antispam-messagedata: +tdttAiIbdU/Ad2Pt0Hb6z93JHihevomQRGvcFZILQYBhMPEDwoeYgOEzdJQd3xU6Rc5uvuZXySuZ/ZPS0DCEq8OhxM/iCfFKdNLYgVeylXV/HYk52arjOtYceUihRqQ56EcyXnNuJCraTa83VDsFQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ed4890-2d92-49ee-5074-08d7db0fd2ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 16:22:10.2393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/wp40T4LGovuDYR/DXHkMKluBoCozjseS0Z04tmdxPTHhXU8AhLyHvKc8cbwEnARbgB+VlET1zC8sV8dFjEKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2548
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_092219_414633_AD0D5086 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Masahiro,

I'm wondering what is proper way to deal with such type of regressions?
Is is responsibility of person who change kconfig to check (and possibly adjust) affected defconfigs?

A question for you as a kconfig expert :)

---
 Eugeniy Paltsev


________________________________________
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Sent: Tuesday, April 7, 2020 19:19
To: linux-snps-arc@lists.infradead.org; Vineet Gupta
Cc: linux-kernel@vger.kernel.org; Alexey Brodkin; Masahiro Yamada; Thomas Zimmermann; Eugeniy Paltsev
Subject: [PATCH] ARC: [plat-hsdk]: fix USB regression

As of today the CONFIG_USB isn't explicitly present in HSDK defconfig
as it is implicitly forcibly enabled by UDL driver which selects CONFIG_USB
in its kconfig.
The commit 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
reverse the dependencies between UDL and USB so UDL now depends on
CONFIG_USB and not selects it. This introduces regression for ARC HSDK
board as HSDK defconfig wasn't adjusted and now it misses USB support
due to lack of CONFIG_USB enabled.

Fix that.

Fixes: 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/configs/hsdk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 0974226fab55..f79c15892704 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -65,6 +65,7 @@ CONFIG_DRM_UDL=y
 CONFIG_DRM_ETNAVIV=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_USB
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
--
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
