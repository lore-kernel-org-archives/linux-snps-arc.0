Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC442C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 20:48:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8951D207BC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 20:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+d3j2ly";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Xkyui+VX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ja9HBSDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8951D207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGIloBa+4hf90bGNBoXLaBKsnVXLd0+sPFjLe2krOOw=; b=K+d3j2lyQ7/lFG
	uoXx+7leEc9PfEZjMYSc/7JyjKCdGYUFyFC8M35Rv/H0WA4TvqGiBXoLOyuZwpMzqS0IEmmJMeL1v
	gNr5hIP2VTozZdvpDPBUUGxW1iP8tRigD7L/K+z72KHFeJHFkkcuAafIuAlOCBZhnuh/uL939u1Aq
	VpiiQeB9egMwkL+uA/EL9fj+zF6UhaUitlN+E1Ts2KCDXqaUaT2Fj757bZK/SfymTUD6jmyWqC61a
	fYx0BJbYyHkD3nTWYj+ZZSq/r+LlSA6rGsGFPn39Q4Cuz6IpV25JLtzG95tA8oMT73RCRcvgxvIHi
	pb6Bn/pCBaNjdW5ZITmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jelv8-0004R5-4m; Fri, 29 May 2020 20:48:02 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jelv5-0004QF-Oz
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 20:48:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 448804094C;
 Fri, 29 May 2020 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590785276; bh=jJ2i7qdxRmtVvYj+X5kWTxRQgZJ9Kh3c2U5J3YrNGik=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Xkyui+VX1/avhVv3pr1wulVc0GXvOq2Nb6gPUKfRcsYXHL/FNsiHDElc1c25UjXOX
 wkSb9hKDJsA1I+P3ul8flfE3Ci3y+5CwKoP+JLsxYkLaxgW7yH3VWdFSNQnGCoVZYM
 NYS1DSDrjPiZ7w1RzRPms/IofEPhx+PI5ffZFcR66pIMiCcMeZ4M+85CcPSdwFHjPX
 VzmwzCaG/UjpdV/X+D5kb5rmbQA5NgczkSnREdb0qOQ4+gPSnO/szIfQCKgYRl+Mkk
 1vG1fmqWKIOGK2WcMTXsOBvZW/24PoVJegxkHKgymRjjkEdkXsCcSGLzij6aMnuOBS
 fg7b/LEYC3ETQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id F3542A0069;
 Fri, 29 May 2020 20:47:55 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 May 2020 13:47:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 29 May 2020 13:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhMhFJqqk89Ilo3fIyL8Y9rAA2pzGmSgmBwOX7OGvlUhRvshO3fGYbE7Bv4ltqWT47bZdEoASX1mJK6m8xbRiIVnscLWfGFMDl4LqA9pXJRroigN5jynXwW0kvNqos/fu+BgENTguIxurdd8EgZKpLPzZWZK9bugar99Vz378W2ieXYBcXAPtYCF9/UAN+g5L+GcfqNcHQqnqbCQWyULMG6eKeHfOv/knj86o08oNIfqjZvAGoUZvs/K6uMFOy5hc2+cxPO2hC7FJcPyT6TaKw/nFVgzgRwXfZmjVHPmPhzp78/jwgI0WyshyLQ1jTI9B1mzeOp7Omz95agM8wgfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ2i7qdxRmtVvYj+X5kWTxRQgZJ9Kh3c2U5J3YrNGik=;
 b=ZvT4UIcPTVapC2mYYS27H8vGL8FE6WwYkxp7syxf6X4TU+rHNR7k8CstBY36elTLW9zo+06M3Wru/yEZBIQt3HvbcAEgaJhClx7I70efDAluHXkKq+b5jUVZhu16OgfKKpFRwRZsH79jDk7SAVc/STppglaQ2IV3+g5Mls+i5Xz5Yqq5Nv35LxSF/4Qakf1LU3iOVJhT9VvV+hc2htagJoIT6Ii3/Jh3jyDtFLRB8du0LPgfytpNU5N339wbVLohS9kesT1DSMZoS5XFf+gy+/PYtuLS1phRvvVHKyGFi9HcoVk0D3juCuuSGrwdnN5K8GhQGxNiZKWsQm+d4RFulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ2i7qdxRmtVvYj+X5kWTxRQgZJ9Kh3c2U5J3YrNGik=;
 b=Ja9HBSDQsgi1B3edJVmRG6FTS89506lG/qkk+76Pc6Sw01/CbjzFviBh9vMBXbFIWarzpeQ4YuQVmeSkZOImgGQ9S8cQWp6CWbpqe9/mIrx+QARzEm23CALaeDPoZn2rlO0PwCRfMKXnbGeVxzLx7TPNPl0W6joGpiAIT4Hdcgs=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3575.namprd12.prod.outlook.com (2603:10b6:a03:ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 20:47:17 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 20:47:17 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 1/3] ARC: allow to overide default mcpu compiler flag
Thread-Topic: [PATCH 1/3] ARC: allow to overide default mcpu compiler flag
Thread-Index: AQHWNbAt4qzSjtc+Cku0PN3e5ay0Bqi/iUwA
Date: Fri, 29 May 2020 20:47:17 +0000
Message-ID: <c1dee77e-f8e3-1213-61a9-390412bfb5ee@synopsys.com>
References: <20200529115534.22883-1-Eugeniy.Paltsev@synopsys.com>
 <20200529115534.22883-2-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200529115534.22883-2-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93f3ddf8-17dc-4204-c6a5-08d8041179b8
x-ms-traffictypediagnostic: BYAPR12MB3575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3575FDFC4E7F203E5A36192FB68F0@BYAPR12MB3575.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WNz7hEdj5su46jJ0PQeS8XnIxe5CCw62tx7vTha2jzXDz/w9AhcRVztSd+g7Ce9TXFsgsauPu5w5lA6suHxa60JCXxP3tEGwfCXsh5C/imvTRdm60bHKaSHGjB3ZcPG5sWanezmtesHyuc2hx/ckFCbDN1v4bRdN2lLFw3dmtYR1LcF481R874oenyOJvgsD3qCENlJ8TjLFk7KOW7MquGzeLizfZNrffgUHC/M9XCcU9UWCYTRZn+Fy3IsLzS0EYj0yXYZ98+QL8gEBURoMDBJB+W7JVkldxFbyeo/BUDz+ZhG7XKC2V4aWIWeWbUeGw1WQDEoXDHDqy/h4V43kmffPGu5+Lfhcgx7W7aVAoJfuayV5F23/gjgWDbgWp082ZV0HQfMzJzu00NCKkCunOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(346002)(366004)(376002)(396003)(6512007)(66476007)(31696002)(66946007)(8676002)(36756003)(186003)(2616005)(107886003)(8936002)(6486002)(53546011)(4326008)(6506007)(26005)(66556008)(478600001)(31686004)(66446008)(64756008)(2906002)(54906003)(86362001)(71200400001)(316002)(110136005)(76116006)(5660300002)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: sf/IgQBbXF8lXxPfNQulMoDo1xE6HJXVMF3kiXcw5iNQkPjrxGYczu2rzSttKBQKtSWLFCAEv9J5w/cJ5BsYpP0dC11EyzgOWxj5pieu9IlLbALrLBIsUwffGj5dwH47xeQhFwMHL6HyJCKVOoIK/OSPobVY+3SjbMTH0XKtaYfZ2L1j/J2l36jsRPgac4biFnkdiUCgkuqFA7jfCp5JCFeIqbnzcI7CN0cCmna1GEONjikUZyQ/k28I5YtSf1SxoCK/Z6MCMXwEnMQKB3PNddUyZp9JgZguukF8UUsETK8TYo3MCdS81wbs4LxtqLHAsNO8B+vIy3L2MfEcqV9ysqkmWabaVeZxwzH6/Cyk1KCEvtzBeqd1Hu9//eHmuQH4xQZsFNvVBZCJh3zZomoGErjufYA8z9Cb4o+XWdcIdKwFELX+vqbG7/qelRKHWBS8W4ToMew5I6NNi6jwUB1e7/dB1lQChePT8tFKg8BfC5c=
Content-ID: <F0F40BD766F98D4981E79ADEB8FBF3BC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f3ddf8-17dc-4204-c6a5-08d8041179b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 20:47:17.4653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkuycj6w2DVSSodexkGvrEHVokFhKjm5jne8y+3ijQxxEdMWIpJKn//a70aZ52yEa35quAgV+f6gpFELP9fUWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3575
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_134759_871708_F4AF94CE 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/29/20 4:55 AM, Eugeniy Paltsev wrote:
> By default we set -mcpu=xxx compiler flag depending on the CPU ISA
> version. It's good starting point, however that may be not enough
> as for some platforms we may want to use some specific 'mcpu'
> options for better optimization or to workaround HW issues.
> 
> We are going to use this option for HSDK-4xD board support.
> In addition it also allows to awoid patching 'mcpu' in ARC Makefile
> when we building Linux for some non-standard simulation or FPGA-based
> platforms.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

Question: So now if I build in buildroot with -mhs38_linux, it will use hard float
(kernel should not use floating point) but the libgcc linked will be different too
and that should be OK ?

I've rewritten the changelog.

  kernel builds set their own default -mcpu for a given ISA build.
  But that gets in the way of "custom" -mcpu flags from propagating
  into kernel build.

  This will also be used in next patches for HSDK-4xD board support which
  uses a different -mcpu to effect dual issue scheduling.



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
