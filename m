Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A591C33CB3
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 20:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF89C22522
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 20:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HYdvgKgg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MeH0L6ut";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="CJA0rURn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF89C22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4gyrRd2dF2gvJmcKnbhckxyBTgUuQE8GpY90J98oKoI=; b=HYdvgKggkZsupD
	o17Lrm0ruecgb7ns6ABMU2tCET0l66tvKF+o/5we9iJ+HDWUpyh3KFml/9lIlMFR10S+6bbLgi3Og
	fIlJcRnSL1F8VnrkQ5UYDR6T/xQMv8CpZzAR9qauwDbnCHnOfnss4G40rdft8FNikRmseUP1AkK9u
	fpeUfv342Aaea+7E+fucsOKg0J2qtBFrkln2wHWqUxflCoZG59ip+mlMrH2MnXYzs+Fn6i00PWzJ5
	vNYDQnzLqz+7jFbBzvwKxHMr7hvwr/40HFBXRt85roau07r9ZHv5QBiyVmbaige1AurV3LNzE+E9U
	4igzV5Q+Wtk4uzsWx48w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irp0F-0002PV-GQ; Wed, 15 Jan 2020 20:10:59 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irp09-0002NO-Au
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 20:10:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1827DC0522;
 Wed, 15 Jan 2020 20:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579119047; bh=iT+JPL0vBzFL1iJ/Qa2F7LKgzb09GlIeIDNDgO7s6F8=;
 h=From:To:CC:Subject:Date:From;
 b=MeH0L6ut32BSeJ5F1RN2pqcC7h1ilKn+MTwpbsi6BFiRDqlADsOZ6z/qtXA/apbYZ
 TL/5zCibE30clWBcx0oeabUEvulGj8afqFTnuPfc0QaDQwkPFxLKiH2fBl+cjHh6QI
 +SAskTiTFk9PkfynTYmCpcA0QpApooS+VlO+NZV4anqx7CwSaW5A0KF0TPc0u6fpjF
 PGDgqIHCSeZMUSS0fJmU7z0/T3ujk9bSeAvtKeA0lgi/ShkBmUGcE6ipBzeOzVx2IH
 sle9VXUi+t7wzKdzcobgVGafhjnX1rCiZZhbMFfY5d+xOWEfTAl7o8GtNCVmW4Oyhr
 Apuy8XI8xIb2g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5F8F5A0079;
 Wed, 15 Jan 2020 20:10:45 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 12:10:40 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 12:10:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV5QuV2vvNrw8uuBjASq71YogxN5DGsj2SmEvyVGGFNuAARUsCF1MHm8nVBAdov6caBikEKv8XJYB+0bLlN+OQrzIc4NInweA+mqDfnZ87xHKagDZ6gbyKQpbecSJX3ufGJfrfcoTbQTiIL8uhOu4N1Ho4igv3RMubOfNsQIZAZ7wx7tnyaQDPDqvcBTn9TMZBhCs02CWxC6T9HsSK+nJBaaZ4WQXsmSvfeyRA38K3++yvT7ZyQcGobMMwiBRhcaEh5R1MchOHfWYMmbgPvKu2Tiv7hxeMZDDNA1wF5+wzO8ZnJ1LAusdli/mGpcRFrZ+wubA3WrhoQBIO8PH/n8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT+JPL0vBzFL1iJ/Qa2F7LKgzb09GlIeIDNDgO7s6F8=;
 b=TYT41KtuR9DfWoS0oe6Z0k22ZufxAp4BYWqsEUAw+6Wne4r3nRN3dWSJObvheOPr8V2J4bVf0Hyzj68ATjCXpwF++k+QPFOjGYvMvrEWebdwP0xe0mjuiLDcSmwxbXeharYpATOzIQM68yJobPMoaH4Qx79aRReElUlu/uEHxVpMlA7qOGxMuXHQAVg2frw883egaUiD1WGaoznw4yWg3HibP9Tne54to1SHDLlISP2970g5LEVxI3o1uYnX7/b/f3jFAXzPblejzcTiEwB/L+FssY8Y2tc6WfiVCRZ4YstquSho8exwqhg1li756QnXd7l3f78f3+W40rHQ0fabQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT+JPL0vBzFL1iJ/Qa2F7LKgzb09GlIeIDNDgO7s6F8=;
 b=CJA0rURnqPfZFYE3825TJzK/xp3znplHuMw706Fh3VgFS3fZleV/WQxJ/whCuigxnTVb1Nz9HconAOqgZY8mvFPDTgvLUeskgUTR7OA1qcjSLyUsqaZ5EPh9ngfXPVRch4I1O8oFxV3WkQ065Y1/R0WyeRz7hD2Cv88Hrg8+fqQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3191.namprd12.prod.outlook.com (20.179.92.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Wed, 15 Jan 2020 20:10:38 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 20:10:38 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "strace-devel@lists.strace.io" <strace-devel@lists.strace.io>
Subject: strace breaks with to be released glibc 2.31
Thread-Topic: strace breaks with to be released glibc 2.31
Thread-Index: AQHVy9/aVBuvHnmiwEyaTxAUJlL79g==
Date: Wed, 15 Jan 2020 20:10:38 +0000
Message-ID: <a3f63e62-e616-5fee-1f31-a09eb25406ef@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 0a16e1df-fbf1-4bc9-9547-08d799f6fd18
x-ms-traffictypediagnostic: BYAPR12MB3191:
x-microsoft-antispam-prvs: <BYAPR12MB3191CDFEF4614E848B7FA867B6370@BYAPR12MB3191.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(6486002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(31686004)(31696002)(2616005)(8676002)(4744005)(81166006)(81156014)(2906002)(8936002)(6506007)(71200400001)(4326008)(316002)(86362001)(5660300002)(6512007)(36756003)(6916009)(478600001)(186003)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3191;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twIRT/pchqJYHL33wW2PLVqynUyepqn0vCMbfwRCmda8V/Oun0/zFjXLFWT2u8ej7LYmcsaw7/GhWJV6x7R3ztAv3+Y3bp+6ymNoRl2VXHIQGleeQN4AF9r/YlVI+tTrIWUQW5XEQ25n3FJFTQQoBPNsG36j4DVNcMdZZMSwpmlzY2hN03bM9kRmwy0PPT7bFOiTxaXp4Tzv3wuX9fgqoVwoix9cTtiBPtzMHD4EYJWVsqH4ek6aLb0TbSMkT/rQ8bWomxTIXOKf8vUMg0obfkdkh7ZwK3z09+3w1thmpe7z02wDWCepX8R8nfqbl//LZR1eya4wZ+TV2mL9z6mm++OUYOWLIXChx/x8Fd9ocP+t2uQ8ESQNG+15mWkgWzxIj27kU2y/iSbEUDUmK+b3WxHO3dGutkJcUtKtQyezKzNAOHblB+PocFg5zypq/mlg
x-ms-exchange-transport-forked: True
Content-ID: <51E11FB52C02EF489DBBD24057179104@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a16e1df-fbf1-4bc9-9547-08d799f6fd18
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 20:10:38.1466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zeKXlHhahHhccikte8Bs4+jY+oiCt3/KON9i43apkkMXBuwx9LRUhdbChh00V83glTAILDIEEi5z3adWJrm4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3191
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_121053_555990_B0177DC4 
X-CRM114-Status: UNSURE (   8.77  )
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

I've been testing an in-works glibc port for ARC and with 2.31 there's a glibc
change which seems to break strace.

Commit d1e411e5c786ce3 "Add PTRACE_GET_SYSCALL_INFO from Linux 5.3 to sys/ptrace.h."

This now defines PTRACE_GET_SYSCALL_INFO but defines struct __ptrace_syscall_info
(not the non underscored ver) causing strace to trip.

I'm not sure how to fix strace: do we need to switch over to glibc provided
__ptrace_syscall_info (with some #ifdef GLIBC and MINOR etc) or is there a better
way to do this ?

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
